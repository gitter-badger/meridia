class Evaluation
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  has_and_belongs_to_many :tests
end
