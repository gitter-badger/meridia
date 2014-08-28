class AdditionalService
  include Mongoid::Document
  field :name, type: String
  field :price, type: Integer
  field :description, type: String

  belongs_to :payment
 end
