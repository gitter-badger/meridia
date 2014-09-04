class Center
  include Mongoid::Document

	field :name, type: String
  field :address, type: String
  field :phone, type: String
  field :inscription, type: Integer, default: 0

  has_many :users
end
