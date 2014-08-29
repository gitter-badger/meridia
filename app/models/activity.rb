class Activity
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :objective, type: String
  field :description, type: String
  field :participants, type: Integer
	field :difficulty, type: Integer
	field :cognitive, type: Integer
	field :physical, type: Integer

  
	has_and_belongs_to_many :areas
  has_many :lessons
	
	has_and_belongs_to_many :members
  accepts_nested_attributes_for :areas
  accepts_nested_attributes_for :lessons, :allow_destroy => true

  validates_presence_of :title
end
