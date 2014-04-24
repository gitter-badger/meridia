class Answer
  include Mongoid::Document
  field :points, type: String
  field :description, type: String
  field :observation, type: String
	
	belongs_to :test
	belongs_to :question
	belongs_to :member
	belongs_to :vig
	belongs_to :options_answers
end
