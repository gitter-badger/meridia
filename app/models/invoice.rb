class Invoice
  include Mongoid::Document
  field :date_service, type: Date
  field :date_create, type: Date
  field :description, type: String
  field :status, type: Boolean

  belongs_to :member
  #belongs_to :additional_service
  embeds_one :additional_service

  validates_presence_of :date_service
end
