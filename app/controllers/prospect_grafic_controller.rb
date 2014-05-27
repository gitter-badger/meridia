class ProspectGraficController < ApplicationController
  def index
		if params[:search].nil?
  		@date_start = (Time.now - 30.days).strftime("%F")
			@date_end = (Time.now + 1.days).strftime("%F")
		else
			@date_start = params[:search][:start_date]
			@date_end = params[:search][:date_end]
		end
			@data_member = ProspectMember.where(:created_at.gte=> @date_start, :created_at.lte =>@date_end)
			@data = Prospect.where(:created_at.gte=> @date_start, :created_at.lte =>@date_end)
	end

end
