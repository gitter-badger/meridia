class Lesson
  include Mongoid::Document
  include Mongoid::Enum

  enum :day, [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday ]

  field :hour, type: Integer
  field :minutes, type: Integer
  field :length, type: Integer

  embedded_in :activity

end
