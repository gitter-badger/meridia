class ProgressController < ApplicationController
	before_filter :authenticate_user!
	#load_and_authorize_resource
	def index
		@member= Member.find(params[:member_id])
    @vigs = @member.vigs.withot_nursing.desc(:created_at)
    @attr = Vig.test_applicate(@vigs)
    @sings = @member.signs.limit(40)
  end

	def show
	end

	def create
		@vig = Vig.find(params[:vig_id])
		redirect_to new_vig_probien_path(@vig)	
	end
end
