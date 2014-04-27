class Form
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  has_many :members, :class_name => "Input"
end
