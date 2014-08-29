class Payment
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :price, type: Integer
  field :description, type: String
  field :date
  field :type
  
  embedded_in :invoice

  validates_presence_of :price
end
