class Doctor
  include Mongoid::Document
  belongs_to :members
	
	field :name, type: String
  field :specialty, type: String
  field :biper, type: String
  field :phone_job, type: String
  field :address, type: String
end
