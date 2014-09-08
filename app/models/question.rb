class Question
  include Mongoid::Document

  field :content, type: String
  #field :points, type: String
  #field :level, type: String
  field :type, type: String
	field :sec, type: String
	field :group,	type:  Integer

	has_many :answers
  belongs_to :tests

  belongs_to :parent, :class_name => "Question"
  has_many :questions, :foreign_key => "parent_id"

  has_many :options_answers

  accepts_nested_attributes_for :options_answers, :questions

end
