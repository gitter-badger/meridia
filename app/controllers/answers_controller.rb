class AnswersController < ApplicationController
	def index
		@answers = Answer.where(vigs_test_id: params[:vigs_test_id])
		@member = @answers[0].vig.member
	end
	def create
		test = Test.find(params[:test_id])
		answers= params[:answers].values.collect { |q| Answer.new(q)}	
		vig = params[:answer][:vigs]
		vig_test = VigsTest.new(status: true ,vig_id: vig, test_id: test.id)
		

		if answers.all?(&:valid?)
			answers.each do |anw|
				anw.vigs_test_id = vig_test.id	
				anw.save!
			end
		
			vig_test.calcule(test)
			redirect_to answers_all_path(vig_test)
		
		else
			redirect_to vig_test_path(vig,test)
		end
	
	end
end
