class Blood < Evaluation

  LEVELS = [
    ["Palpitaciones", 1], 
    ["Marcapasos", 2],
    ["Extremidades Frias", 3],
    ["No productiva", 4],
    ["Cianosis", 5],
    ["Hormigueo", 6]
  ]

  field :level, type: Integer, default: 1
  field :note, type: String, default: nil

  belongs_to :member
end
