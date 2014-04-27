class Input
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  belongs_to :form
  embeds_many :answers

  belongs_to :parent, :class_name => "Input"
  has_many :inputs, :foreign_key => "parent_id"
end
