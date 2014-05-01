class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member.allergies.build kindof: :medicine
    @member.medicines.build day: [:monday, :tuesday, :wednesday, :thursday, :friday ]
    @member.build_breath
    @member.build_blood
    @member.build_other
    @member.build_nutrition
    @member.build_body
    @member.build_urinary
    #@sign = Sign.new
    #sign = @member.signs.build
    #sign.measures.build( kindof: :ta )
    #sign.measures.build( kindof: :fc )
    #sign.measures.build( kindof: :fr )
    #sign.measures.build( kindof: :temp )
    #sign.measures.build( kindof: :o2 )
    #sign.measures.build( kindof: :glucose )
    #sign.measures.build( kindof: :weight )
    #sign.measures.build( kindof: :height )
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
			@member = Member.find(params[:id])
		end
		

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :addres, :phone, :age, :code, :status, customer_attributes:[:name], signs_attributes:[ measures_attributes:[:kindof, :value ]] )
    end
end
