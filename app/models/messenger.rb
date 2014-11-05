class Messenger
  include Mongoid::Document
  field :text, type: String
  field :subjet, type: String
  field :status, type: String
end
