class Invoice
  include Mongoid::Document
  field :date_service, type: Date
  field :date_create, type: Date
  field :description, type: String
  field :status, type: Boolean

  belongs_to :member
  #belongs_to :additional_service
  has_many :additional_service
  embeds_many :list_services

  #accepts_nested_attributes_for :list_services
end
