class Tag
  include Mongoid::Document
  belongs_to :user
  belongs_to :mailbox
  belongs_to :message
  field :name, type: String
end
