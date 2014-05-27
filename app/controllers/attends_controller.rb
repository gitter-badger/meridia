class AttendsController < ApplicationController
  
	def index
 		@hour = Time.now.to_formatted_s(:time)
		@day = Time.now.strftime('%w')
		stat_day = Time.now.beginning_of_day
		@members = Member.all
		@attends = Attend.where(:created_at => {:$gte => stat_day, :$lte => Time.now.utc})
	end

  def create
		members = params[:attend][:member_id]
		members.each do |id|
			attend = Attend.create(member_id: id)
			attend.save
		end
		redirect_to attends_path
	end

  def new
  end

  def show
  end

  def update
  end
end
