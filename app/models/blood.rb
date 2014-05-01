class Blood
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Enum

  LEVELS = [
    ["Palpitaciones", 1], 
    ["Marcapasos", 2],
    ["Extremidades Frias", 3],
    ["No productiva", 4],
    ["Cianosis", 5],
    ["Hormigueo", 6]
  ]

  #enum :level, [ :monday, :tuesday, :wednesday, :thursday, :friday ], { :multiple => true , :default => [ :monday ]  }
  field :level, type: Array, default: [1]
  field :note, type: String, default: nil

  embedded_in :member
end
