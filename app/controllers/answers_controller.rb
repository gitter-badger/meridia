class AnswersController < ApplicationController
	def index
	end
	def create
		member = params[:member_id]
		vig = params[:vig_id]
		answers= params[:answers].values.collect { |q| Answer.new(q)}	
		if answers.all?(&:valid?)
			answers.each(&:save!)
			redirect_to member_vig_answers_path(member, vig)
		end
	
	end
end
