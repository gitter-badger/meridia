class Mobilization < Evaluation

  field :mobilization, type: Integer, default: 1
  field :dominant_member, type: Integer, default: 1
  field :devices, type: Integer, default: 0

  belongs_to :member
end
