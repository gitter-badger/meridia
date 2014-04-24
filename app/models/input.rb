class Input
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  embedded_in :form
  embeds_many :answers
end
