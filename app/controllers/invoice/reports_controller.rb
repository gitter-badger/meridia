class Invoice::ReportsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
  def index   
    
    if params[:search].nil?
      @date_start = (Time.now - 30.days).strftime("%F")
      @date_end = (Time.now + 1.days).strftime("%F")
    else
      @date_start = params[:search][:start_date]
      @date_end = params[:search][:date_end]
    end
    invoices = Invoice.get_start_end_date(@date_start,@date_end)
    @cant_members = Member.where(status: 1).length
    @pending_pays=invoices.where(status: 1).length
    @total_pays=invoices.where(status: 3).length
    @sum_total_pays=invoices.where(status: 3).sum(:total)
    pays_by_months = mount_for_month(invoices)
    pays_by_days = report_day(invoices)  
    # cantidad de ingresos entre factura del mes divido 12845
    @fte = ((@sum_total_pays/12845.0)).round(2)
    gon.arr_months = pays_by_months[:arr_months]
    gon.arr_pays = pays_by_months[:arr_pays]
    gon.arr_days = pays_by_days[:arr_days]
    gon.arr_pays_day = pays_by_days[:arr_pays]
  end  

  private

  def mount_for_month invoices
    invoices= invoices.where(status: 3).group_by { |m| m.created_at.beginning_of_month }
    arr_months =  invoices.map { |k,v| [k.strftime("%B - %Y")]}
    arr_total =  invoices.map {|h,k| k.inject(0) {|sum, hash| sum + hash["total"]}}
    {:arr_months => arr_months, :arr_pays => arr_total}
  end

  def report_day invoices
    invoices = invoices.order_by(:created_at.asc)
    invoices= invoices.where(status: 3).group_by { |m| m.created_at.day } 
    #members_day =  invoices.group_by { |m| m.created_at.day }    
    arr_days =  invoices.map { |k,v| [k]}
    arr_pays =  invoices.map { |k,v| v.length}    
    {:arr_days => arr_days, :arr_pays => arr_pays}
  end
end
