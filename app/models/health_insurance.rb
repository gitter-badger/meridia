class HealthInsurance
  include Mongoid::Document
  
	embedded_in :member

	field :company, type: String
  field :policy_number, type: Integer
  field :licence_number, type: String
  field :institute, type: String
end
