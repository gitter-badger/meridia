class AdditionalServicesController < ApplicationController
  before_action :set_additional_service, only: [:show, :edit, :update, :destroy]

  # GET /additional_services
  # GET /additional_services.json
  def index
    @member= Member.find(params[:member_id])
    @additional_services = AdditionalService.all
    @invoice =  Invoice.invoice_validate(@member)
    @adittional = @invoice.list_services.sum('price')
    @list_service = ListService.new
    @invoices = @member.invoices
  end

  # GET /additional_services/1
  # GET /additional_services/1.json
  def show
  end

  # GET /additional_services/new
  def new
    @additional_service = AdditionalService.new
  end

  # GET /additional_services/1/edit
  def edit
  end

  # POST /additional_services
  # POST /additional_services.json
  def create
    @additional_service = AdditionalService.new(additional_service_params)

    respond_to do |format|
      if @additional_service.save
        format.html { redirect_to @additional_service, notice: 'Additional service was successfully created.' }
        format.json { render action: 'show', status: :created, location: @additional_service }
      else
        format.html { render action: 'new' }
        format.json { render json: @additional_service.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  # PATCH/PUT /additional_services/1
  # PATCH/PUT /additional_services/1.json
  def update

    respond_to do |format|
      if @additional_service.update(additional_service_params)
        format.html { redirect_to @additional_service, notice: 'Additional service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @additional_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /additional_services/1
  # DELETE /additional_services/1.json
  def destroy
    @additional_service.destroy
    respond_to do |format|
      format.html { redirect_to additional_services_url }
      format.json { head :no_content }
    end
  end

  def del_relation
    @member = Member.find(params['format'])
    service = AdditionalService.find(params['additional_id'])   
     if  @member.payments.first.additional_services.delete(service)
      redirect_to member_payments_path(@member)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_additional_service
      @additional_service = AdditionalService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def additional_service_params
      params.require(:additional_service).permit(:id,:name, :price, :description , :additional_id)
    end
end
