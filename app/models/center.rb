class Center
  include Mongoid::Document

	field :name, type: String
  field :address, type: String
  field :phone, type: String
  field :inscription, type: Integer
end
