class Breath < Evaluation

  #include Mongoid::Document
  #include Mongoid::Timestamps

  LEVELS = [
    ["Regular Sin Esfuerzo", 1], 
    ["Campos Pulmonares Limpios", 2],
    ["Secreciones", 3],
    ["Tos", 4],
    ["Palpitaciones", 5],
    ["Productiva", 6]
  ]

  field :level, type: Integer, default: 1
  field :note, type: String, default: nil

  #embedded_in :member
  belongs_to :member
end
