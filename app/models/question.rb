class Question
  include Mongoid::Document
  field :body, type: String
  field :points, type: String
  field :level, type: String
	
	has_many :answers
	belogs_to :tests
end
