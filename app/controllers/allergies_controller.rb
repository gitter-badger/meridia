class AllergiesController < ApplicationController
  #before_action :set_vig, only: [:show, :edit, :update, :destroy]
  #before_action :set_member,only: [:index, :show, :create, :update]
  before_filter :authenticate_user!
	load_and_authorize_resource
  # GET /allergies
  # GET /allergies.json
  def index
    #@medicals = Medical.all
    @member = Member.find(params[:member_id])
    #@vie =  Vig.find_by( member: @member, kind: :nursing )
  end

  # GET /nursing/1
  # GET /nursing/1.json
  def show
    #@member= Member.find(params[:member_id])
  end

  # GET /allergies/new
  def new
    @member = Member.find(params[:member_id])
    @allergy = @member.allergies.build

    # check for initial evaluation
    @member.vigs.create! kind: :nursing

    @member.allergies.build kindof: :medicine
    @member.medicines.build day: [:monday, :tuesday, :wednesday, :thursday, :friday ]
  end

  # GET /allergies/1/edit
  def edit
  end

  # POST /allergies
  # POST /allergies.json
  def create
    #@vig = Vig.new(vig_params)
    @member = Member.find(params[:member_id])
    @allergy = Allergy.new(allergy_params)
    respond_to do |format|
      if @allergy.save!
        format.html { redirect_to member_allergies_path(@member), notice: 'Activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allergies/1
  # PATCH/PUT /allergies/1.json
  def update
    respond_to do |format|
      if @vig.update(vig_params)
        format.html { redirect_to @vig, notice: 'Vig was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /allergies/1
  # DELETE /allergies/1.json
  def destroy
    @member = Member.find(params[:member_id])
    @allergy = Allergy.find(params[:id])
    @allergy.destroy
    respond_to do |format|
      format.html { redirect_to member_allergies_url( @member ) }
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
  def allergy_params
    params.require(:allergy).permit(:name, :kindof, :member_id)
  end
end
