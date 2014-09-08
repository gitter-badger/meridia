class MedicinesController < ApplicationController
  #before_action :set_vig, only: [:show, :edit, :update, :destroy]
  #before_action :set_member,only: [:index, :show, :create, :update]
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /medicines
  # GET /medicines.json
  def index
    #@medicals = Medical.all
    @member = Member.find(params[:member_id])
    #@vie =  Vig.find_by( member: @member, kind: :nursing )
  end

  # GET /medicines/1
  # GET /medicines/1.json
  def show
    #@member= Member.find(params[:member_id])
  end

  # GET /medicines/new
  def new
    @member = Member.find(params[:member_id])
    @medicine = @member.medicines.build
    # check for initial evaluation
    # @member.medicines.build day: [:monday, :tuesday, :wednesday, :thursday, :friday ]
  end

  # GET /medicines/1/edit
  def edit
  end

  # POST /medicines
  # POST /medicines.json
  def create
    #@vig = Vig.new(vig_params)
    @member = Member.find(params[:member_id])
    @day = medicine_params[:day].map{|day| day.to_sym }
    #medicine = medicine_params.except)_
    
    @medicine = Medicine.new(medicine_params.except(:day).merge!({day: @day}))
    respond_to do |format|
      if @medicine.save!
        format.html { redirect_to member_medicines_path(@member), notice: 'Activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicines/1
  # PATCH/PUT /medicines/1.json
  def update
    respond_to do |format|
      if @vig.update(vig_params)
        format.html { redirect_to @vig, notice: 'Vig was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # DELETE /medicines/1
  # DELETE /medicines/1.json
  def destroy
    @member = Member.find(params[:member_id])
    @medicine = Medicine.find(params[:id])
    @medicine.destroy
    respond_to do |format|
      format.html { redirect_to member_medicines_url( @member ) }
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
  def medicine_params
    params.require(:medicine).permit(:name, :frequency, :dose, :way, :validity, :member_id, day:[] )
  end
end
