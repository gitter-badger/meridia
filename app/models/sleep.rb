class Sleep < Evaluation

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
