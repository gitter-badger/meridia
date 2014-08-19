class ProbienController< ApplicationController
	before_filter :authenticate_user!
	#load_and_authorize_resource
	def index
		@activities = Activity.all
	end

	def new
		@vig = Vig.find(params[:vig_id])
		@member = @vig.member_id
		@probien = Probien.new
		@probien.descriptions.build
  
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
		params.require(:probien).permit(:objetive,:cognitive,:physical,:health,:physical,:personaldev,:social,:activity_ids=>[], descriptions_attributes:[:name])
	end
end
