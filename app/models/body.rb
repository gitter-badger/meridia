class Body < Evaluation

  LEVELS = [
    [ "Piel", [["Rosada", 1], ["Palida", 2], ["Cianotica", 3], ["Icterica", 4], ["Seca", 5], ["Lesiones", 6]] ],
    [ "Mucosas", [ [ "Hidratadas", 1 ], [ "Deshidratadas", 2 ] ] ],
    [ "Dentición", [ [ "Completa", 1 ], [ "Incompleta", 2 ], [ "Prótesis", 3 ], [ "Puente", 4 ], [ "Otro", 5 ] ] ],
    [ "Cavidad oral", [ [ "Placas", 1 ], [ "Enrojecimiento", 2 ], [ "Lesiones", 3 ] ] ],
    [ "Caídas Previas", "radio", [ [ "No", 0 ], [ "Si", 1 ], [ "Ninguno", 1 ], [ "Sedante", 1 ], [ "Diureticos", 1 ] ] ],
    [ "Medicamentos", "radio", [ ["Hipotensores", 1], ["Antiparkinsionano", 1], [ "Antidepresivo", 1 ], [ "Otros medicamentos", 1 ] ] ],
    [ "Déficits sensoriales", "radio", [ ["Ninguno", 0], ["Alteraciones visuales", 1], ["Alteraciones auditivas", 1], ["Extremidades", 1] ] ],
    [ "Estado Mental", "radio", [["Orientado", 0], ["Confuso", 1] ] ],
    [ "Deambulación", "radio", [ ["Normal", 0], ["Segura con ayuda", 1], ["Insegura con ayuda/sin ayuda", 1], ["Imposible", 1] ] ]
  ]

  field :levels, type: Array, default: []

  field :skin, type: Integer, default: 1
  field :mucous, type: Integer, default: 1
  field :dentition, type: Integer, default: 1
  field :oral_cavity, type: Integer, default: 1
  field :previous_fallen, type: Integer, default: 1
  field :medicines, type: Integer, default: 1
  field :sensory_deficits, type: Integer, default: 1
  field :state_of_mind, type: Integer, default: 1
  field :ambulation, type: Integer, default: 1

  belongs_to :member
end
