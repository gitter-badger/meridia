class Lesson
  include Mongoid::Document
  include Mongoid::Multitenancy::Document 
  include Mongoid::Enum
	
  tenant(:center)
  
  enum :day, [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday ]

  field :hour, type: Integer
  field :minutes, type: Integer
  field :length, type: Integer

  belongs_to :activity	

end
