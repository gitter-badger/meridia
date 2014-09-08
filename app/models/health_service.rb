class HealthService
  include Mongoid::Document
  
	embedded_in :member

	field :hospital, type: String
  field :phone1, type: String
  field :phone2, type: String
  field :address, type: String

end
