class ProspectsController < ApplicationController
  before_action :set_prospect, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  before_filter :authenticate_user!
  load_and_authorize_resource
  # GET /prospects
  # GET /prospects.json
  def index
    @prospects = Prospect.order(sort_column + ' ' + sort_direction)
  end

  # GET /prospects/1
  # GET /prospects/1.jso
  def show
		@tickets = @prospect.tickets.desc(:event_date)
		@prospect_member = @prospect.prospect_member
		@ticket = Ticket.new 
	end

  # GET /prospects/new
  def new
    @prospect = Prospect.new
  	@prospect.prospect_member = ProspectMember.new
	end

  # GET /prospects/1/edit
  def edit
  end

  # POST /prospects
  # POST /prospects.json
  def create
    @prospect = Prospect.new(prospect_params)

    respond_to do |format|
      if @prospect.save
        format.html { redirect_to @prospect, notice: 'Prospect was successfully created.' }
        format.json { render action: 'show', status: :created, location: @prospect }
      else
        format.html { render action: 'new' }
        format.json { render json: @prospect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prospects/1
  # PATCH/PUT /prospects/1.json
  def update
    respond_to do |format|
      if @prospect.update(prospect_params)
        format.html { redirect_to @prospect, notice: 'Prospect was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @prospect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prospects/1
  # DELETE /prospects/1.json
  def destroy
    @prospect.destroy
    respond_to do |format|
      format.html { redirect_to prospects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prospect
      @prospect = Prospect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prospect_params
      params.require(:prospect).permit(:code, :name, :lastname, :phone, :mobile, :mail, :contact_type, :colonia, :delegacion, :status, :observation, 
			:prospect_member_attributes=>[:name,:lastname,:genre,:age,:phone,:mobile,:cognitive, :physical, :transport, :pathology_ids => []
			])
    end

      def sort_column
        params[:sort] || "name"
      end
      
      def sort_direction
        params[:direction] || "asc"
      end
end
