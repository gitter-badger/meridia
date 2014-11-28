class Messenger
  include Mongoid::Document
  has_many :users
  belongs_to :mailbox
  has_many :tags
  
  field :text, type: String
  field :subjet, type: String
  field :status, type: String

end
