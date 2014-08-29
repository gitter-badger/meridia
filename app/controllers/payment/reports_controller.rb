class Payment::ReportsController < ApplicationController
  layout 'admin'  
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  def index
    render json: "crud"
  end 

  def payments
    render json: "payments"
  end 

  def assistance
    render json: "assistance"
  end  
end
