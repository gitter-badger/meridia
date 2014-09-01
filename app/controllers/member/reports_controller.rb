class Member::ReportsController < ApplicationController
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
    @data_member = Member.where(:created_at.gte=> @date_start, :created_at.lte =>@date_end).asc(:created_at)
    g =  @data_member.group_by { |m| m.created_at.beginning_of_month }    
    arr_months =  g.map { |k,v| [k.strftime("%B - %Y")]}
    arr_members =  g.map { |k,v| v.length}    
    gon.arr_members = arr_members
    gon.arr_months = arr_months
  end  

end
