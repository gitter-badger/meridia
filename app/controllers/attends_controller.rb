class AttendsController < ApplicationController
  before_filter :authenticate_user!
	load_and_authorize_resource

	def index
 		@hour = Time.now.to_formatted_s(:time)
		@day = Time.now.strftime('%w')
    stat_day = Time.now.beginning_of_day.utc
		@members = Member.attends
    @attends = Attend.between(entry_time: stat_day..Time.now.utc)
  end

  def create
		if params[:attend]
						members = params[:attend][:member_id]
						members.each do |id|
							attend = Attend.create(member_id: id)
							#attend.save
						end
		end
		redirect_to attends_path
	end

  def new
  end

  def show
  end

  def update
		attend =Attend.find(params[:id])
		attend.update
		redirect_to attends_path
  end

	private
	def attend_params
		params.require(:attend).permit(:member_id=>[])	
	end

end
