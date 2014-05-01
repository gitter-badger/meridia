class Body
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Enum

  LEVELS = [
    [ "Piel", "radio", [ [ "Rosada", 1 ], [ "Pálida", 2 ], [ "Seca", 3 ], [ "Ictérica", 4 ], [ "Seca", 5 ], [ "Lesiones", 6 ] ] ],
    [ "Mucosas", "radio", [ [ "Hidratadas", 1 ], [ "Deshidratadas", 2 ] ] ],
    [ "Dentición", "radio", [ [ "Completa", 1 ], [ "Incompleta", 2 ], [ "Prótesis", 3 ], [ "Puente", 4 ], [ "Otro", 5 ] ] ],
    [ "Cavidad oral", "radio", [ [ "Placas", 1 ], [ "Enrojecimiento", 2 ], [ "Lesiones", 3 ] ] ],
    [ "Caídas Previas", "radio", [ [ "No", 0 ], [ "Si", 1 ], [ "Ninguno", 1 ], [ "Sedante", 1 ], [ "Diureticos", 1 ] ] ],
    [ "Medicamentos", "radio", [ ["Hipotensores", 1], ["Antiparkinsionano", 1], [ "Antidepresivo", 1 ], [ "Otros medicamentos", 1 ] ] ],
    [ "Déficits sensoriales", "radio", [ ["Ninguno", 0], ["Alteraciones visuales", 1], ["Alteraciones auditivas", 1], ["Extremidades", 1] ] ],
    [ "Estado Mental", "radio", [["Orientado", 0], ["Confuso", 1] ] ],
    [ "Deambulación", "radio", [ ["Normal", 0], ["Segura con ayuda", 1], ["Insegura con ayuda/sin ayuda", 1], ["Imposible", 1] ] ]
  ]

  field :levels, type: Array, default: []

  embedded_in :member
end
