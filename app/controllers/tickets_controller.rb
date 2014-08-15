class TicketsController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource
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
