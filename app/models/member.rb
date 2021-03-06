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
  accepts_nested_attributes_for :families, reject_if: proc{|attr| attr['firstname'].blank?}
  accepts_nested_attributes_for :health_insurances, reject_if: proc{|attr| attr['company'].blank?}
  accepts_nested_attributes_for :health_services, reject_if: proc{|attr| attr['company'].blank?}
  accepts_nested_attributes_for :signs
  accepts_nested_attributes_for :allergies, reject_if: proc{|attr| attr['name'].blank?}
  accepts_nested_attributes_for :medicines, reject_if: proc{|attr| attr['name'].blank?}
  accepts_nested_attributes_for :breaths
  accepts_nested_attributes_for :bloods
  accepts_nested_attributes_for :others
  accepts_nested_attributes_for :nutritions
  accepts_nested_attributes_for :bodies
  accepts_nested_attributes_for :depositions
  accepts_nested_attributes_for :mobilizations
  accepts_nested_attributes_for :hygienes
  accepts_nested_attributes_for :communications
  accepts_nested_attributes_for :sleeps
  accepts_nested_attributes_for :pains

  field :name, type: String
  field :lastname, type: String
  field :gender, type: Integer, default: 1
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
  field :status, type: Integer, default: 0
	field :days, type: Array
  field :avatar, type:String
	field :monthly_payment, type:Integer, default: 0
  field :payment_add, type: Integer, default: 0 

	mount_uploader :avatar, AvatarUploader
  validates_presence_of :name, :lastname, :gender, :phone
  
  STATUS=[["pendiente", 0],["activo","1"],["baja",2],["baja permanente",3],["prueba",4]]

  scope :pendiente, -> {where(status: 0)}
  scope :activo, -> {where(status: 1)}
  scope :baja, -> {where(status: 2)}
  scope :permanente, -> {where(status: 3)}
  scope :prueba, -> {where(status: 4)}
  scope :attends, -> {where(:status.in=> [1,4])}
  scope :inclulle_pendiente,-> {where(:status.in=> [0,1,4])}
end
