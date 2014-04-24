class OptionsAnswer
  include Mongoid::Document
  field :content, type: String
  field :points, type: String
	field	:description, type: String
	belongs_to  :question

	has_many :answers
end
