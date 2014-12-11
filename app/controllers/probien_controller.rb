class ProbienController< ApplicationController
	before_filter :authenticate_user!
	#load_and_authorize_resource
	def index
		@activities = Activity.all
	end

	def new
    @member = Member.find(params[:member_id])
    vigs = @member.vigs.active
    @probien= @member.probiens.open.last
    @probien = @probien.nil? ? Probien.create : @probien
    @probien.set_probien(vigs)
    @probien.descriptions.build
	end

	def update
    member = Member.find(params[:member_id])
    probien = Probien.find(params[:id])
    probien.open = false
    probien.update_attributes(params_probien)
    member.probiens << probien
    
		redirect_to new_member_schedule_path(member)
	end

	private
	def params_probien
		params.require(:probien).permit(:objetive,:cognitive,:physical,
                                    :health,:physical,:personaldev,:social,
                                    :abvd,:aivd,:tinetti,:folstein,:yesavage,:hamilton,
                                    :nutrition,:oars,:mmse,
                                    :activity_ids=>[], descriptions_attributes:[:name])
	end
end
