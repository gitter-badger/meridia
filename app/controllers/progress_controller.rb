class ProgressController < ApplicationController
	def index
	end

	def create
		@vig = Vig.find(params[:vig_id])
		@vig.calculate
		@vig.save
		redirect_to new_vig_probien_path(@vig)	
	end
end
