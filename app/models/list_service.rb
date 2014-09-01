class ListService
  include Mongoid::Document
  field :date_service, type: Date
  field :name, type: String
  field :price, type: Float
  field :description, type: String
  field :type,        type: Integer, default: 0
  
  TYPE = [['Descuento', 1],['Servicio',0]]

  embedded_in :invoice

  before_save :type_service

  def type_service
    if self.type == 1 && self.type != 0
      self.price = self.price.to_i * -1
    end
  end
end
