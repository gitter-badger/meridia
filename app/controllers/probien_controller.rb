class ProbienController< ApplicationController
	
	def index
		@activities = Activity.all
		
	end

	def new
		@vig = Vig.find(params[:vig_id])
		@member = @vig.member_id
		@probien = Probien.new
		@activities = Activity.all
	end

	def create
		probien = Probien.new(params_probien)
		vig = Vig.find(params[:vig_id])
		vig.status = 2	
		vig.probien = probien
		vig.save
		redirect_to new_vig_schedule_path(vig)
	end

	private
	def params_probien
		params.require(:probien).permit(:objetive,:cognitive,:physical,:health,:physical,:personaldev,:social,:activity_ids=>[])
	end
end
