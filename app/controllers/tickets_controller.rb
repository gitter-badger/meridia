class TicketsController < ApplicationController
	#before_filter :authenticate_user!
	#load_and_authorize_resource
	def create
    @ticket = Ticket.new(ticket_params)
    prospect =Prospect.find( params[:prospect_id])
		@ticket.user = current_user
    customer = prospect.change_status(params[:status])
	  prospect.tickets << @ticket
    if !customer.nil?
      redirect_to edit_customer_path (customer)
    else
      redirect_to prospect_path (params[:prospect_id])
    end
  end

	def update
		@ticket = Ticket.find(params[:id])
		@ticket.update_attributes(:status => 1)
		redirect_to prospect_path (params[:prospect_id])
	end
	private
	def ticket_params
		params.require(:ticket).permit(:title,:type,:observation,:call,:event_date,)
	end
end
