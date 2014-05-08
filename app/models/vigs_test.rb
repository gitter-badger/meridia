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
		res = send(test.calculate)
	end

	def barthel
		suma
		self.vig.update_attributes(abvd: self.points)
	end

	def mental
		suma
		self.vig.update_attributes(folstein: self.points)
	end

	def lawton
		suma	
		self.vig.update_attributes(aivd: self.points)
	end

	def tinetti
		option
		self.vig.update_attributes(tinetti: self.points)
	end

	def hamilton
		option
		self.vig.update_attributes(hamilton: self.points)
	end
	def yesavage
		suma
		self.vig.update_attributes(yesavage: self.points)
	end
	def oars
		suma
	end	
	def suma
		total = 0
		answers = self.answers 
		answers.each do |a|
			total += a.options_answers.points.to_i
		end
		self.points = { total: total }
		self.save!
	end

	def option 
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
		self.points = {total: group1, total2: group2 } 
		self.save!
	end

end
