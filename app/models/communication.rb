class Communication < Evaluation


  field :see, type: Integer, default: 0
  field :hear, type: Integer, default: 0
  field :speak, type: Integer, default: 0
  field :hearing_aid, type: Integer, default: 0
  field :contact_lenses, type: Integer, default: 0
  field :glasses, type: Integer, default: 0
  field :observations, type: String, default: nil

  belongs_to :member
end
