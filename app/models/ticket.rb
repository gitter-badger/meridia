class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps
	field :type, type: String
  field :observation, type: String
  field :call, type: String
  field :visit, type: String
  field :event_date, type: String
	field :title, type: String

	belongs_to :prospect
end
