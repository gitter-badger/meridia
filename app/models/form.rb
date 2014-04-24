class Form
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  embeds_many :members, :class_name => "Input"
end
