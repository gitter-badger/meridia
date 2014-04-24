class Test
  include Mongoid::Document
	
	field :title, type: String
  field :observation, type: String
  field :description, type: String
	
	
	has_many :questions
	has_and_belongs_to_many  :vigs
	has_many :vigs_test
	accepts_nested_attributes_for :questions
	
end