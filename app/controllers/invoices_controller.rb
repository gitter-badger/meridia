class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
   @member= Member.find(params[:member_id])
   @additional_services = AdditionalService.all
   @invoices =  Invoice.where(date_create: Date.today.at_beginning_of_month...Date.today.at_end_of_month)
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show

  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
    @additional_service = @invoice.additional_services.build
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.date_create = Date.current 
    if params['additional_service']
      additional_service =  AdditionalService.find(params['additional_service'])
      @invoice.additional_service = additional_service
    end
    if @invoice.save
      redirect_to member_invoices_path(@invoice.member)
    else
      redirect_to member_invoices_path(@invoice.member)
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    binding.pry
    data = invoice_params
    data[:list_services][:date_service].to_date 
    respond_to do |format|
      if @invoice.list_services << ListService.new(invoice_params[:list_services])
        format.html { redirect_to member_additional_services_path(@member), notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    redirect_to member_invoices_path(@invoice.member)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:date, :description, :date_service ,:additional_service , :member, list_services:[:date_service,:name, :price, :description])
    end
end
