class Sign
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Attributes::Dynamic
  embeds_many :measures

  belongs_to :member
  accepts_nested_attributes_for :measures
end
