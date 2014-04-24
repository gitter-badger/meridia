class Family
  include Mongoid::Document
  
	embedded_in :member

	field :firstname, type: String
  field :lastname, type: String
  field :relationship, type: String
  field :phone_home, type: String
	field :address, type: String
  field :city, type: String
	field :phone_mobile, type: String
end