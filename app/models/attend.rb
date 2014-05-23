class Attend
  include Mongoid::Document
  include Mongoid::Timestamps
	belongs_to :members
	
	field :time, type: Time
end
