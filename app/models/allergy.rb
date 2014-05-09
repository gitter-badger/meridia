class Allergy
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  enum :kindof, [:medicine, :food ]

  field :name, type: String
  #embedded_in :member
  belongs_to :member
end
