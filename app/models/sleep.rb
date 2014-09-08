class Sleep < Evaluation

  LEVELS = [
    [ "Horas de Sueno", [ ["<6 horas", 1], ["De 6 a 8 horas", 2], [">8 horas", 3] ]],
    [ "Patron de Sueno", [ ["Continuo", 1], ["Discontinuo", 0] ]]
  ]

  field :duration, type: Integer, default: 1
  field :nap, type: Integer, default: 1
  field :pattern, type: Integer, default: 1
  field :drugs, type: Integer, default: 1
  field :drugs_note, type: String, default: nil
  field :other, type: Integer, default: 1
  field :other_note, type: String, default: nil
  field :observations, type: String, default: nil

  belongs_to :member
end
