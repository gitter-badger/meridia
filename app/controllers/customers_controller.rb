class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  #load_and_authorize_resource
  def new
    @customer = Customer.new
    @member = @customer.members.build
    family = @member.families.build
    health = @member.health_insurances.build
    service = @member.health_services.build
  end
  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
        redirect_to members_path
    else
      render action: 'edit' 
    end
    
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end   

    def customer_params
      params.require(:customer).permit(:name,:lastname,:phone,:mobile,:address, :neighborhood,
        members_attributes:[
                :id,
                :name,
                :lastname,
                :address,
                :phone,
                :birthday_city,
                :date_borth,
                :neighborhood,
                :city,
                :status,
                :monthly_payment,
                :days =>[],
      ])
    end
end
