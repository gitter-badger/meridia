class VigsTest
  include Mongoid::Document
 	include Mongoid::Timestamps
	field :status, type: String
	field :points, type: Integer	
	belongs_to :vig
	belongs_to :test
	has_many :answers

	def calcule_points(test,number, total_points)
		case test.calculate
			when :average
				res = total_points / number
				self.update_attributes(points: res)			
			
			when :sum
				self.update_attributes(points: total_points)
			else
				self.update_attributes(points: 0)
		end
	end

end
