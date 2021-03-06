class MembersController < ApplicationController
  helper_method  :sort_column, :sort_direction
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
 # load_and_authorize_resource
  # GET /members
  # GET /members.json
  def index
    @members = Member.inclulle_pendiente.order_by(sort_column+" "+ sort_direction)
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @probien = @member.probiens.last
    @family = Family.new
    if @member.status == 0
      redirect_to edit_customer_path(@member.customer)
    end
  end

  # GET /members/new
  def new
    @member = Customer.new
	end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    respond_to do |format|
      if @center.members << @member
        format.html { redirect_to center_member_path (@center), notice: 'Member was successfully created.' }
        format.json { render action: 'show', status: :created, location: @member }
      else
        format.html { render action: 'new' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end

    def sort_column
      params[:sort] || "name"
    end
    
    def sort_direction
      params[:direction] || "ASC"
    end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
			@member = Member.find(params[:id])
		end
		

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :addres, :phone, :age, :avatar, :avatar_cache, :code, :status, customer_attributes:[:name], signs_attributes:[ measures_attributes:[:kindof, :value ]], allergies_attributes: [ :id, :kindof, :name ], medicines_attributes: [ :id, :name, :frequency, :doses, :way, :validity, :day => [] ] )
    end
    
end
