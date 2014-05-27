class Attend
  include Mongoid::Document
  include Mongoid::Timestamps
	belongs_to :member
	
	field :time, type: Time
end
