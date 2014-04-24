class VigsTest
  include Mongoid::Document
  field :status, type: String
	
	belongs_to :vig
	belongs_to :test
end
