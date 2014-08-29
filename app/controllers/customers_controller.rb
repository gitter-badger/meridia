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

  def create
    @customer= Customer.new(customer_params)
    if @customer.save
        redirect_to members_path
    else
      render action: 'new' 
    end
    
  end

  private
    def set_customer
      @customer = Customer.find(params[:customer_id])
    end   

    def customer_params
      params.require(:customer).permit(:name,:lastname,:phone,:mobile,:address, :neighborhood,
        members_attributes:[
                :name,
                :lastname,
                :address,
                :phone,
                :birthday_city,
                :date_borth,
                :neighborhood,
                :city,
                :monthly_payment,
                :days =>[],
        families_attributes:[
                :firstname,
                :lastname,
                :relationship,
                :phone_home,
                :address,
                :phone_mobile,
                :city
      ],
        health_insurances_attributes:[
          :company,
          :licence_number,
          :policy_number,
          :institute,
        ],
        health_services_attributes:[
          :hospital,
          :phone2,
          :phone1,
          :address
        ],
        payments_attributes:[
          :price,
          :description
        ]
      ])
    end
end
