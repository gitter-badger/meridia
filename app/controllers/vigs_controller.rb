class VigsController < ApplicationController
  before_action :set_vig, only: [:show, :edit, :update, :destroy]
	before_action :set_member,only: [:index, :show, :create, :update]
  before_filter :authenticate_user!
  load_and_authorize_resource 
  # GET /vigs
  # GET /vigs.json
  def index
    @vigs = Vig.all
  end

  # GET /vigs/1
  # GET /vigs/1.json
  def show
  	@member= Member.find(params[:member_id])
	end

  # GET /vigs/new
  def new
    @vig = Vig.new
  end


  def create
		member = Member.find(params[:member_id])
    current_vig = member.vigs.last
		@vig = Vig.new(vig_params)
		if !current_vig.nil?
			@vig.abvd = current_vig.abvd
			@vig.aivd = current_vig.aivd
			@vig.tinetti = current_vig.tinetti
			@vig.folstein = current_vig.folstein
			@vig.yesavage = current_vig.yesavage
			@vig.hamilton = current_vig.hamilton
			@vig.nutrition = current_vig.nutrition
			@vig.oars = current_vig.oars
		end	
		respond_to do |format|
      if @member.vigs << @vig
				format.html { redirect_to member_vig_path(@member, @vig), notice: 'Vig was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  private
    def set_member
			@member = Member.find(params[:member_id])
		end
		# Use callbacks to share common setup or constraints between actions.
    def set_vig
      @vig = Vig.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vig_params
      params.require(:vig).permit(:name, :date, :test_ids=>[])
    end
end
