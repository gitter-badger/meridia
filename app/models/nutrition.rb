class Nutrition < Evaluation

  #LEVELS = [
  #  [ "Perdida de peso > 5kg sin causa aparente", "radio", [ [ "Si", 1 ], [ "No", 0 ] ] ],
  #  [ "Dificultad para masticar", "radio", [ [ "Si", 1 ], [ "No", 0 ] ] ],
  #  [ "Dificultad para deglutir", "radio", [ [ "Si", 1 ], [ "No", 0 ] ] ],
  #  [ "Ninguna de las anteriores", "radio", [ [ "Si", 1 ], [ "No", 0 ] ] ],
  #  [ "En los últiimos 3 días ha presentado algúm cambio en el aparato digestivo", "other", [ [ "Si", 1 ], [ "No", 0 ] ], "Cual?"  ],
  #  [ "Ninguna de las anteriores", "radio", [ [ "Si", 1 ], [ "No", 0 ] ] ],
  #  [ "Alimentos que le causen malestar:", "text" ],
  #]

  field :lose, type: Integer, default: 0
  field :masticate, type: Integer, default: 0
  field :eat, type: Integer, default: 0
  field :none, type: Integer, default: 1
  field :change, type: Integer, default: 0
  field :change_note, type: String, default: nil
  field :note, type: String, default: nil
  field :foods, type: String, default: nil

  #field :levels, type: Array, default: []

  belongs_to :member
end
