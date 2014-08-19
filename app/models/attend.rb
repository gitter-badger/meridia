class Attend
  include Mongoid::Document
  include Mongoid::Timestamps
	belongs_to :member
	
	field :time, type: Time
	field :entry_time, type: Time
	field :exit_time, type: Time


end
