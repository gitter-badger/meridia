class Mailbox
  include Mongoid::Document
  belongs_to :user
  has_many :messengers
  has_many :tags
  
  field :name, type: String
end
