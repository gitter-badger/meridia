class AnswersController < ApplicationController
	def index
	end
	def create
		test = params[:test_id]
		answers= params[:answers].values.collect { |q| Answer.new(q)}	
		if answers.all?(&:valid?)
			answers.each(&:save!)
			VigsTest.create(status: true , vig_id: params[:vig], test_id: test)
			redirect_to test_answers_path(test)
		else
			redirect_to vig_test_path(params[:vig],test)
		end
	
	end
end
