class ScheduleController < ApplicationController
  def index
		@member = Member.find(params[:member_id])
		@activities = @member.activities
	end

	def new
		@vig = Vig.find(params[:vig_id])
		@member = @vig.member 
		@current_activity = @vig.member.activities
		@activities = Activity.all
	end


	def create
		@member = Member.find(params[:member_id])
		@member.activities.clear
		@member.update_attributes(member_params)
		redirect_to member_schedule_index_path(@member)	
	end

	private
	def member_params
		params.require(:member).permit(activity_ids: [])	
	end
end
