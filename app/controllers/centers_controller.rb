class CentersController < ApplicationController
  include MembersHelper
  include VigsHelper
  before_filter :authenticate_user!
	load_and_authorize_resource
	before_action :set_center, only: [:show, :edit, :update, :destroy]
  
	# GET /centers
  # GET /centers.json
  def index
    @centers = Center.all
  end

  # GET /centers/1
  # GET /centers/1.json
  def show
    if current_user.roles.where(name: "Ventas").exists?
      @result = {}
      @result['tickets'] = Prospect.count
      @result['cancelaciones'] = Prospect.where(:status=>'Cancel').count
      @result['ventas'] = Prospect.where(:status=>'Venta').count
      @result['visitas'] = Ticket.where(:type=>'Cita').count
      @date_start = (Time.now - 30.days).strftime("%F")
      @date_end = (Time.now + 1.days).strftime("%F")
      @data_member = ProspectMember.where(:created_at.gte=> @date_start, :created_at.lte =>@date_end)
      @data = Prospect.where(:created_at.gte=> @date_start, :created_at.lte =>@date_end)

      render "show"
    else
      members=Member.all
      @members = {}
      @mental =[]
      @members['all'] = members.count
      @members['female'] = members.where(gender: 'female').count
      @members['male'] = members.where(gender: 'male').count
      sum_years = 0
      con_edad = 0
     
      members.each do |member|
        if member['date_borth'] && @members['all'] > 0      
         sum_years += age(member['date_borth'])
         con_edad += 1
        end       
      end
      
      gon.mental = arr_cognitiva(members)
      gon.dependencia = arr_dependencia(members)   

      @members['edad_promedio']=sum_years > 0 ? (sum_years/con_edad) : 0

      render  "show1"
    end
  end

  def show1
    members=Member.all
    @members = {}
    @mental =[]
    @members['all'] = members.count
    @members['female'] = members.where(gender: 'female').count
    @members['male'] = members.where(gender: 'male').count
    sum_years = 0
    con_edad = 0
   
    members.each do |member|
      if member['date_borth'] && @members['all'] > 0      
       sum_years += age(member['date_borth'])
       con_edad += 1
      end       
    end
    gon.mental = arr_cognitiva(members)
    gon.dependencia = arr_dependencia(members)   

		@members['edad_promedio']=sum_years > 0 ? (sum_years/con_edad) : 0
  end

  # GET /centers/new
  def new
    @center = Center.new
  end

  # GET /centers/1/edit
  def edit
  end

  # POST /centers
  # POST /centers.json
  def create
    @center = Center.new(center_params)

    respond_to do |format|
      if @center.save
        format.html { redirect_to @center, notice: 'Center was successfully created.' }
        format.json { render action: 'show', status: :created, location: @center }
      else
        format.html { render action: 'new' }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centers/1
  # PATCH/PUT /centers/1.json
  def update
    respond_to do |format|
      if @center.update(center_params)
        format.html { redirect_to @center, notice: 'Center was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centers/1
  # DELETE /centers/1.json
  def destroy
    @center.destroy
    respond_to do |format|
      format.html { redirect_to centers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center
      @center = current_user.center
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def center_params
      params.require(:center).permit(:name, :address, :phone)
    end
end
