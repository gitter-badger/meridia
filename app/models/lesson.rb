class Lesson
  include Mongoid::Document
  include Mongoid::Multitenancy::Document 
  include Mongoid::Enum
	
  tenant(:center)
  
  enum :day, [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday ]

  field :hour, type: Integer
  field :minutes, type: Integer
  field :length, type: Integer
  has_and_belongs_to_many :members
  belongs_to :activity	

end
