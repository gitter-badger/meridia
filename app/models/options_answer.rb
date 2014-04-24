class OptionsAnswer
  include Mongoid::Document
  field :content, type: String
  field :points, type: String
	field	:description, type: String
	embedded_in :question
end
