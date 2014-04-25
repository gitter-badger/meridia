class VigsTest
  include Mongoid::Document
  field :status, type: String
	field :points, type: Integer	
	belongs_to :vig
	belongs_to :test
	has_many :answers

	def calcule_points(test,number, total_points)
		case test.calcule
			when 1
				res = total_points / number
				self.update_attributes(points: res)			
			when 2
			else
		end
	end

end
