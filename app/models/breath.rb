class Breath
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Enum

  LEVELS = [
    ["Regular Sin Esfuerzo", 1], 
    ["Campos Pulmonares Limpios", 2],
    ["Secreciones", 3],
    ["Tos", 4],
    ["Palpitaciones", 5],
    ["Productiva", 6]
  ]

  #enum :level, [ :monday, :tuesday, :wednesday, :thursday, :friday ], { :multiple => true , :default => [ :monday ]  }
  field :level, type: Array, default: [1]
  field :note, type: String, default: nil

  embedded_in :member
end
