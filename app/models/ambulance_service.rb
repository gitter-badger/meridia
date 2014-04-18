class AmbulanceService
  include Mongoid::Document
  field :policy_numbre, type: String
  field :company, type: String
  field :phone1, type: String
  field :phone2, type: String
end
