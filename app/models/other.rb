class Other < Evaluation

  field :edema, type: Integer, default: 1
  field :edema_level, type: Integer, default: 0
  field :capilar, type: Integer, default: 0

  belongs_to :member
end
