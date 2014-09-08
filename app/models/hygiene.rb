class Hygiene < Evaluation

  LEVELS = [
    [ "Preferencia Hora de bano", [ ["Matutino", 1], ["Vespertino", 2], ["Nocturno", 3] ]],
    [ "Frecuencia de lavado de cabello", [ ["Diario", 1], ["Cada 3er Dia", 2], ["Otro", 3 ] ]],
    [ "Frecuencia de lavado de dientes", [ ["1 dia", 1], ["2 dia", 2], ["3 dia", 3] ]]
  ]

  field :bath, type: Integer, default: 1
  field :hair, type: Integer, default: 1
  field :teeth, type: Integer, default: 1
  field :observations, type: String, default: nil

  belongs_to :member
end
