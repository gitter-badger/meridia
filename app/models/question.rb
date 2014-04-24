class Question
  include Mongoid::Document
  
	field :content, type: String
  field :points, type: String
  field :level, type: String
	field :type, type: String

	has_many :answers
	belongs_to :tests
	embeds_many :options_answers

	accepts_nested_attributes_for :options_answers

end
