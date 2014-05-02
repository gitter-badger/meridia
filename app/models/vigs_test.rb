class VigsTest
  include Mongoid::Document
 	include Mongoid::Timestamps
	
	field :status, type: String
	field :points, type: Hash	
	field :res, type: Integer
	belongs_to :vig
	belongs_to :test
	has_many :answers
	def calcule(test) 
		send(test.calculate)
	end

	def calculate_barthel
		total = 0
		answers = self.answers 
		answers.each do |a|
			total += a.options_answers.points.to_i
		end
		self.points = { total: total }
		self.save!
	end

	def hamilton 
		group1 = 1
		group2 = 2
		answers = self.answers 
		answers.each do |a|
			if a.question.group == 1
			group1 += a.options_answers.points.to_i
			elsif a.question.group == 2
				group2 += a.options_answers.points.to_i
			end
		end
		self.points = {total1: group1, total2: group2 } 
		self.save!
	end
end
