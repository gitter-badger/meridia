class Pathology
  include Mongoid::Document
  field :name, type: String
	
	belongs_to :prospect_member
end
