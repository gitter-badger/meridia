class VigsController < ApplicationController
  before_action :set_vig, only: [:show, :edit, :update, :destroy]
	before_action :set_member,only: [:index, :show, :create, :update]

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

  # GET /vigs/1/edit
  def edit
  end

  # POST /vigs
  # POST /vigs.json
  def create
    @vig = Vig.new(vig_params)
    @vig_current = @member.vigs.desc.first
		if !@vig_current.nil?
						@vig.cognitive = @vig_current.cognitive
						@vig.social = @vig_current.social
						@vig.physical = @vig_current.physical
						@vig.personaldev = @vig_current.personaldev
		end
		respond_to do |format|
      if @member.vigs << @vig
        
				format.html { redirect_to member_vig_path(@member, @vig), notice: 'Vig was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH/PUT /vigs/1
  # PATCH/PUT /vigs/1.json
  def update
    respond_to do |format|
      if @vig.update(vig_params)
        format.html { redirect_to @vig, notice: 'Vig was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /vigs/1
  # DELETE /vigs/1.json
  def destroy
    @vig.destroy
    respond_to do |format|
      format.html { redirect_to vigs_url }
      format.json { head :no_content }
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
