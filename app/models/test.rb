class Test
  include Mongoid::Document
  field :title, type: String
  field :observation, type: String
  field :description, type: String
	
	has_many :questions
	belongs_to :vig
end
