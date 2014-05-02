class Vig
  include Mongoid::Document
  include Mongoid::Timestamps
	
	field :name, type: String
  field :date, type: String
	field :status, type: Boolean

	belongs_to :member
	has_and_belongs_to_many  :tests
	has_many :answers
	has_many :vigs_tests


end
