class CustomersController < ApplicationController
	before_action :set_customer, only: [:show, :edit, :update, :destroy]

	def new
		@customer = Customer.new
		@member = @customer.members.build
		@family = @member.families.build
	end

	def create
		@center = Center.find(params[:center_id])
		@customer= Customer.new(customer_params)
		@customer.save
		
		redirect_to center_path(@center)
	end

	private
		def set_customer
			@customer = Customer.find(params[:customer_id])
		end		

		def customer_params
			params.require(:customer).permit(:name,:lastname,:phone,:mobile,:address, :neighborhood,members_attributes:[:name,:lastname,:address,:phone,:age,families_attributes:[:firstname,:lastname,:relationship,:phone_home,:address,:phone_mobile]])
		end
end
