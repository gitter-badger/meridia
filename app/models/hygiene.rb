class Hygiene < Evaluation

  field :bath, type: Integer, default: 1
  field :hair, type: Integer, default: 1
  field :teeth, type: Integer, default: 1
  field :observations, type: String, default: nil

  belongs_to :member
end
