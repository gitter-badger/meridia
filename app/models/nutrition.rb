class Nutrition
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Enum

  LEVELS = [
    [ "Perdida de peso > 5kg sin causa aparente", "radio", [ [ "Si", 1 ], [ "No", 0 ] ] ],
    [ "Dificultad para masticar", "radio", [ [ "Si", 1 ], [ "No", 0 ] ] ],
    [ "Dificultad para deglutir", "radio", [ [ "Si", 1 ], [ "No", 0 ] ] ],
    [ "Ninguna de las anteriores", "radio", [ [ "Si", 1 ], [ "No", 0 ] ] ],
    [ "En los últiimos 3 días ha presentado algúm cambio en el aparato digestivo", "other", [ [ "Si", 1 ], [ "No", 0 ] ], "Cual?"  ],
    [ "Ninguna de las anteriores", "radio", [ [ "Si", 1 ], [ "No", 0 ] ] ],
    [ "Alimentos que le causen malestar:", "text" ],
  ]

  field :levels, type: Array, default: []

  embedded_in :member
end
