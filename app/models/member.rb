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
  #embeds_many :allergies
  has_many :allergies
  #embeds_many :medicines
  has_many :medicines
  #embeds_one :breath
  has_many :breaths
  #embeds_one :blood
  has_many :bloods
  has_many :others
  has_many :nutritions
  #embeds_one :body
  has_many :bodies
  has_many :depositions
  has_many :mobilizations
  has_many :hygienes
  has_many :communications
  has_many :sleeps
  has_many :pains

  accepts_nested_attributes_for :families
  accepts_nested_attributes_for :health_insurances
  accepts_nested_attributes_for :health_services
  accepts_nested_attributes_for :signs, :allergies, :medicines, :breaths, :bloods, :others, :nutritions, :bodies, :depositions, :mobilizations, :hygienes, :communications, :sleeps, :pains

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
