class Vig
  include Mongoid::Document
  field :name, type: String
  field :date, type: String
	
	has_many :tests
	has_many :answers
end
