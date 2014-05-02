class ProbienController< ApplicationController
	
	def index
		@activities = Activity.all
		
	end

	def new
		@vig = Vig.find(params[:vig_id])
		@member = @vig.member
		@activities = Activity.all
	end

	def create
		@vig = Vig.find(params[:vig_id])
		@member = @vig.member
		@member.activities = []
		@member.update_attributes(params_probien)
		@vig.update_attributes(status: true)
		redirect_to member_vig_path(@member, @vig)
	end

	private
	def params_probien
		params.require(:member).permit(:activity_ids=>[])
	end
end
