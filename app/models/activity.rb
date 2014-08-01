class Activity
  include Mongoid::Document
  include Mongoid::Multitenancy::Document 
  include Mongoid::Timestamps
	tenant(:center)

  field :title, type: String
  field :objective, type: String
  field :description, type: String
  field :participants, type: Integer
	field :difficulty, type: Integer
	field :cognitive, type: Integer
	field :physical, type: Integer

  
	has_and_belongs_to_many :areas
  embeds_many :lessons
	
	has_and_belongs_to_many :members
  accepts_nested_attributes_for :areas
  accepts_nested_attributes_for :lessons, :allow_destroy => true

  validates_presence_of :title
end
