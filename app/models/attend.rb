class Attend
  include Mongoid::Document
  include Mongoid::Timestamps
	belongs_to :member
	
	field :time, type: Time
	field :entry_time, type: Time
	field :exit_time, type: Time

	before_create :entry
	before_update :exit
	def entry
		self.entry_time = Time.now
	end

	def exit
		self.exit_time = Time.now
	end

end
