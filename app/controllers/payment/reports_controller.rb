class Payment::ReportsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  def index
    arr_hours= Array.new(11){0}
    members = 0;
    @attends =  Attend.where(created_at: (30.days.ago..Time.now)).desc
    @attends = @attends.order_by(:entry_time => :asc)
    @attends.each do |attend|
        hour = attend.entry_time.hour
        case hour.to_i
        when 8          
          members +=1
          (0..11).map{|n| arr_hours[n]=members}
        when 9
          members += 1
          (1..11).map{|n| arr_hours[n]=members}
        when 10
          members += 1
          (2..11).map{|n| arr_hours[n]=members}
        when 11
          members += 1
          (3..11).map{|n| arr_hours[n]=members}
        when 12
          members += 1
          (4..11).map{|n| arr_hours[n]=members}
        when 13
          members += 1
          (5..11).map{|n| arr_hours[n]=members}
        when 14
          members += 1
          (6..11).map{|n| arr_hours[n]=members}
        when 15
          members += 1
          (7..11).map{|n| arr_hours[n]=members}
        when 16
          members += 1
          (8..11).map{|n| arr_hours[n]=members}
        when 17
          members += 1
          (9..11).map{|n| arr_hours[n]=members}
        when 18
          members += 1
          (10..11).map{|n| arr_hours[n]=members}        
        end        
    end
    @attends.each do |attend|
        hour = attend.exit_time.hour
        case hour.to_i
        when 8          
          members -=1
          (0..11).map{|n| arr_hours[n]=members}
        when 9
          members -= 1
          (1..11).map{|n| arr_hours[n]=members}
        when 10
          (2..11).map{|n| arr_hours[n]=members}
        when 11
          members -= 1
          (3..11).map{|n| arr_hours[n]=members}
        when 12
          members -= 1
          (4..11).map{|n| arr_hours[n]=members}
        when 13
          members -= 1
          (5..11).map{|n| arr_hours[n]=members}
        when 14
          members -= 1
          (6..11).map{|n| arr_hours[n]=members}
        when 15
          members -= 1
          (7..11).map{|n| arr_hours[n]=members}
        when 16
          members -= 1
          (8..11).map{|n| arr_hours[n]=members}
        when 17
          members -= 1
          (9..11).map{|n| arr_hours[n]=members}
        when 18
          members -= 1
          (10..11).map{|n| arr_hours[n]=members}
        end    
   end    
    gon.members = arr_hours
  end  

  def payments
    render json: "payments"
  end 

  def assistance
    render json: "assistance"
  end  
end
