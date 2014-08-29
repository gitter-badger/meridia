class ListServicesController < ApplicationController

  def create
    @invoice = Invoice.find(params[:invoice_id])    
    @invoice.list_services << ListService.new(list_service_params)
    redirect_to member_additional_services_path(params[:member_id])
  end
  def destroy
    invoice = Invoice.find(params[:invoice_id])
    service = invoice.list_services.find(params[:id])
    service.destroy
    redirect_to member_additional_services_path(params[:member_id])
  end

  private

  def list_service_params
    params.require(:list_service).permit(:date_service,:name, :price, :description)
  end
end
