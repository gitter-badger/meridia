class AdditionalService	
  include Mongoid::Document
  field :name, type: String
  field :price, type: Integer
  field :description, type: String

  #has_many :envoices  
  belongs_to :envoice
  validates_presence_of :price
 end
