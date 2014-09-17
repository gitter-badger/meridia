class Payment::ReportsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  def index   
    
    if params[:search].nil?
      @date_start = (Time.now - 30.days).strftime("%F")
      @date_end = (Time.now + 1.days).strftime("%F")
    else
      @date_start = params[:search][:start_date]
      @date_end = params[:search][:date_end]
    end
    user_per_hour = report_day(@date_start,@date_end)
    gon.arr_hours = report_hour(@date_start,@date_end)
    gon.arr_days = user_per_hour[:arr_days]
    gon.arr_users_per_days = user_per_hour[:arr_members]
  end  

  def payments
    render json: "payments"
  end 

  def assistance
    render json: "assistance"
  end

  private

  def report_hour date_start,date_end
    arr_members_hour=[]
    attends = Attend.get_start_end_date(@date_start,@date_end)
    members_enter = attends.asc(:entry_time).group_by { |m| m.entry_time.beginning_of_hour }
    members_out = attends.asc(:exit).group_by { |m| m.exit_time.beginning_of_hour }     
    h_members_enter= members_enter.collect{|k,str|  [k.strftime("%H").to_i,str.length] }    
    h_members_enter = Hash[*h_members_enter.flatten]
    h_members_out= members_out.collect{|k,str|  [k.strftime("%H").to_i,str.length] }
    h_members_out = Hash[*h_members_out.flatten] 
    count=0
    (0..12).each do |i|
      if h_members_enter.has_key? i+7
        count+=h_members_enter[i+7]        
        arr_members_hour[i]=count
      else
        arr_members_hour[i]=count
      end
    end
    (0..12).each do |i|
      if h_members_out.has_key? i+7
        j=i
        count-=h_members_out[j+7]
        (j..12).each do |i|
          arr_members_hour[i]=count
        end   
      end
    end
    arr_members_hour    
  end

  def report_day date_start,date_end
    attends = Attend.get_start_end_date(@date_start,@date_end)
    members_day =  attends.group_by { |m| m.created_at.beginning_of_day } 
    arr_days =  members_day.map { |k,v| [k.strftime("%A")]}
    arr_members =  members_day.map { |k,v| v.length}    
    {:arr_days => arr_days, :arr_members => arr_members}
  end
end
