class Question
  include Mongoid::Document
  
	field :content, type: String
  field :points, type: String
  field :level, type: String
	field :type, type: String

	has_many :answers
	belongs_to :tests
end
