class Test
  include Mongoid::Document
  include Mongoid::Enum

  field :title, type: String
  field :observation, type: String
  field :description, type: String
  field :test_code, type: Integer
	field :calculate, type: Symbol
  field	:function, type: String
	enum :kindof, [:cognitive, :physical, :personaldev, :social]

  has_many :questions
  has_and_belongs_to_many  :vigs
  has_many :vigs_test
  accepts_nested_attributes_for :questions


end
