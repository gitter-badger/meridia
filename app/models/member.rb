class Member
  include Mongoid::Document
  belongs_to :center
	belongs_to :customer
	has_many	:doctors

	embeds_many :families
	embeds_many :health_insurances
	embeds_many :health_services

	accepts_nested_attributes_for :families
	
	field :name, type: String
  field :lastname, type: String
	field :address, type: String
  field :phone, type: String
  field :date_borth, type: Date
	field :birthday_city, type: String
  field :code, type: String
  field :status, type: String


end
