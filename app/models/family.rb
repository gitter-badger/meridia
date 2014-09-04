class Family
  include Mongoid::Document
  
  embedded_in :member

  field :firstname, type: String
  field :lastname, type: String
  field :relationship, type: Integer
  field :phone_home, type: String
  field :address, type: String
  field :city, type: String
  field :phone_mobile, type: String
  field :rated, type: Boolean
  REALTIONSHIP = [["hijo",1],["hermano",2],["nieto",3]]
  validates_presence_of :firstname, :lastname, :phone_home
end
