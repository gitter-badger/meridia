class ProgressController < ApplicationController
	before_filter :authenticate_user!
	#load_and_authorize_resource
	def index
		@member= Member.find(params[:member_id])
	end

	def show
	end

	def create
		@vig = Vig.find(params[:vig_id])
		redirect_to new_vig_probien_path(@vig)	
	end
end
