class Probien
	include Mongoid::Document
	include Mongoid::Timestamps

	field :objetive, type: String
	field :cognitive, type: String
	field :physical, type: String
	field :health,  type: String
	#field :physical, type: String
	field :personaldev, type: String
	field :social, type: String 
	field :observation, type: String

	belongs_to :vig
end
