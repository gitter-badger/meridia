class Activity
  include Mongoid::Document
 	include Mongoid::Multitenancy::Document 
	tenant(:center)

	field :title, type: String
  field :body, type: String
  field :participants, type: String
  field :area, type: String
  field :adjetive, type: String
  field :physical_level, type: String
  field :social_level, type: String
  field :depression_level, type: String
  field :anxiety_level, type: String
end
