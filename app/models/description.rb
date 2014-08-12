class Description
  include Mongoid::Document
  field :name, type: String

  embedded_in :probien
end
