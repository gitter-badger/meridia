class Vig
  include Mongoid::Document
  include Mongoid::Timestamps
	
	field :name, type: String
  field :date, type: String
	field :status, type: Integer
	field	:abvd, type: Hash,default: {total: -1}
	field	:aivd, type: Hash, default: {total: -1}
	field :tinetti, type: Hash, default: {total: -1,total2: -1}
	field :folstein, type: Hash,default: {total: -1}
	field :yesavage, type: Hash,default: {total: -1}
	field :hamilton, type: Hash, default: {total: -1 ,total2: -1}
	field :nutrition, type: Hash,default: {total: -1}
	field :oars, type: Hash,default: {total: -1}
	
	belongs_to :member
	has_one :probien
	has_and_belongs_to_many  :tests
	has_many :answers
	has_many :vigs_tests


end
