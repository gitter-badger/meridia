class ScheduleController < ApplicationController
  #before_filter :authenticate_user!
	#authorize_resource :class => false
  def index
		@member = Member.find(params[:member_id])
		@lessons = @member.lessons
	end

	def new
		@vig = Vig.find(params[:vig_id])
		@member = @vig.member 
		@current_activity = @vig.member.lessons
		@lessons = Lesson.all
	end


	def create
		@member = Member.find(params[:member_id])
		@member.lessons.clear
		@member.update_attributes(member_params)
		redirect_to member_schedule_index_path(@member)	
	end

	private
	def member_params
		params.require(:member).permit(lesson_ids: [])	
	end
end
