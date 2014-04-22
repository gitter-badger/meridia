class Vig
  include Mongoid::Document
  field :name, type: String
  field :date, type: String
	
	belongs_to :member
	has_and_belongs_to_many  :tests
	has_many :answers
end
