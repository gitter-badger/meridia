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
  has_many :invoices
  has_many :allergies
  has_many :medicines
  has_many :breaths
  has_many :bloods
  has_many :others
  has_many :nutritions
  has_many :bodies
  has_many :depositions
  has_many :mobilizations
  has_many :hygienes
  has_many :communications
  has_many :sleeps
  has_many :pains
	has_many :probiens
	has_one :attend
  has_and_belongs_to_many :lessons
  accepts_nested_attributes_for :families
  accepts_nested_attributes_for :health_insurances
  accepts_nested_attributes_for :health_services
  accepts_nested_attributes_for :signs, :allergies, :medicines, :breaths, :bloods, :others, :nutritions, :bodies, :depositions, :mobilizations, :hygienes, :communications, :sleeps, :pains

  field :name, type: String
  field :lastname, type: String
  field :gender, type: Symbol, default: :male
  field :marital_status, type: Symbol, default: :married
  field :country, type: String, default: "mexican@"
  field :origin, type: String, default: "D.F."
  field :education, type: String, default: "Carrera Ejecutiva"
  field :religion, type: String, default: "Catolica"
  field :occupation, type: String, default: "Hogar"
  field :address, type: String
  field :neighborhood, type: String
  field	:city, type: String
  field :phone, type: String
  field :date_borth, type: Date
  field :birthday_city, type: String
  field :code, type: String
  field :status, type: String, default: "active"
	field :days, type: Array
  field :avatar, type:String
	field :monthly_payment, type:String

	mount_uploader :avatar, AvatarUploader
  
  validates_presence_of :name, :lastname, :gender, :date_borth, :phone , :address
end
