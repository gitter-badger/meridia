class Pain < Evaluation

  LEVELS = [
    [ "El dolor lo considera como", [ ["Leve", 1], ["Moderado", 2], ["Severo", 3] ] ]
  ]

  field :has_pain, type: Integer, default: 1
  field :has_pain_note, type: String, default: nil
  field :location, type: String, default: nil
  field :over_pain, type: String, default: nil
  field :level, type: String, default: 1
  field :value, type: String, default: 1

  belongs_to :member
end
