class Activity
  include Mongoid::Document
  include Mongoid::Multitenancy::Document 
  tenant(:center)

  field :title, type: String
  field :objective, type: String
  field :description, type: String
  field :participants, type: Integer

  embeds_many :areas
  embeds_many :lessons

  accepts_nested_attributes_for :areas
  accepts_nested_attributes_for :lessons, :allow_destroy => true

  #field :area, type: String
  #field :adjetive, type: String
  #field :physical_level, type: String
  #field :social_level, type: String
  #field :depression_level, type: String
  #field :anxiety_level, type: String
end
