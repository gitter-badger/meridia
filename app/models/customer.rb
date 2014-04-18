class Customer
  include Mongoid::Document
 	include Mongoid::Multitenancy::Document 
	
	tenant(:center)
 
	has_many :members
	belongs_to :center

	accepts_nested_attributes_for :members

	field :name, type: String
  field :lastname, type: String
  field :phone, type: String
  field :mobile, type: String
  field :contact, type: String
  field :address, type: String
  field :neighborhood, type: String
end
