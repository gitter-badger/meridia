class TicketsController < ApplicationController
	def create
		@ticket = Ticket.new(ticket_params)
		@ticket.prospect_id = params[:prospect_id]
		@ticket.save
		redirect_to prospect_path (params[:prospect_id])
	end
	private

	def ticket_params
		params.require(:ticket).permit(:title,:observation,:call,:event_date)
	end
end
