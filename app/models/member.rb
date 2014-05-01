class Member
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :center
  belongs_to :customer
  has_many	:doctors
  has_many  :vigs
  has_many  :signs
  embeds_many :families
  embeds_many :health_insurances
  embeds_many :health_services
  embeds_many :allergies
  embeds_many :medicines
  embeds_one :breath
  embeds_one :blood
  embeds_one :other
  embeds_one :nutrition
  embeds_one :body
  embeds_one :urinary

  accepts_nested_attributes_for :families
  accepts_nested_attributes_for :health_insurances
  accepts_nested_attributes_for :health_services
  accepts_nested_attributes_for :signs, :allergies, :medicines, :breath, :blood, :other, :nutrition, :body, :urinary

  field :name, type: String
  field :lastname, type: String
  field :address, type: String
  field :neighborhood, type: String
  field	:city, type: String
  field :phone, type: String
  field :date_borth, type: Date
  field :birthday_city, type: String
  field :code, type: String
  field :status, type: String
end
