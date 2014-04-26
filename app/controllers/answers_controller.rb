class AnswersController < ApplicationController
	def index
		@answers = Answer.where(vigs_test_id: params[:vigs_test_id])
		@member = @answers[0].vig.member
	end
	def create
		test = Test.find(params[:test_id])
		answers= params[:answers].values.collect { |q| Answer.new(q)}	
		vig_test = VigsTest.create(status: true , vig_id: params[:answer][:vigs], test_id: test.id)
		
		points = 0

		if answers.all?(&:valid?)
			answers.each do |anw|
				anw.vigs_test_id = vig_test.id	
				anw.save!
				points += anw.options_answers.points.to_i
			end
			vig_test.calcule_points(test,answers.count, points)
			redirect_to answers_all_path(vig_test)
		else
			redirect_to vig_test_path(params[:answer][:vigs],test)
		end
	
	end
end
