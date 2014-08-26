class Payment
  include Mongoid::Document
  
  field :price, type: Integer
  field :description, type: String

  belongs_to :member
  has_many :additional_services

  validates_presence_of :price, :description
end
