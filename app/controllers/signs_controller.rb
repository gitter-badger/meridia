class SignsController < ApplicationController
  #before_action :set_vig, only: [:show, :edit, :update, :destroy]
  #before_action :set_member,only: [:index, :show, :create, :update]

  # GET /signs
  # GET /signs.json
  def index
    @member = Member.find(params[:member_id])
  end

  # GET /signs/1
  # GET /signs/1.json
  def show
    #@member= Member.find(params[:member_id])
  end

  # GET /signs/new
  def new
    @member = Member.find(params[:member_id])

    @sign = @member.signs.build
    @sign.measures.build( kindof: :ta )
    @sign.measures.build( kindof: :fc )
    @sign.measures.build( kindof: :fr )
    @sign.measures.build( kindof: :temp )
    @sign.measures.build( kindof: :o2 )
    @sign.measures.build( kindof: :glucose )
    @sign.measures.build( kindof: :weight )
    @sign.measures.build( kindof: :height )
  end

  # GET /signs/1/edit
  def edit
  end

  # POST /signs
  # POST /signs.json
  def create
    #@vig = Vig.new(vig_params)
    @member = Member.find(params[:member_id])
    @allergy = Sign.new(sign_params)
    respond_to do |format|
      if @allergy.save!
        format.html { redirect_to member_signs_path(@member), notice: 'Activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /signs/1
  # PATCH/PUT /signs/1.json
  def update
    respond_to do |format|
      if @vig.update(vig_params)
        format.html { redirect_to @vig, notice: 'Vig was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /signs/1
  # DELETE /signs/1.json
  def destroy
    @member = Member.find(params[:member_id])
    @sign = Sign.find(params[:id])
    @sign.destroy
    respond_to do |format|
      format.html { redirect_to member_signs_url( @member ) }
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
  def sign_params
    params.require(:sign).permit(:member_id, :measures_attributes => [:kindof, :value])
  end
end
