class ProgressController < ApplicationController
	def index
	end

	def create
		@vig = params[:vigs_id]
		@vig.calculate
		@vig.save
end
