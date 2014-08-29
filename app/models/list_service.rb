class ListService
  include Mongoid::Document
  field :date_service, type: Date
  field :name, type: String
  field :price, type: Integer
  field :description, type: String

  embedded_in :invoice


end
