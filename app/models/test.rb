class Test
  include Mongoid::Document
  include Mongoid::Enum

  field :title, type: String
  field :observation, type: String
  field :description, type: String
  field :test_code, type: Integer
	field :calculate, type: Symbol
  field :code, type: Integer, default: 0
  enum :kindof, [:gerontology, :nursing,:psicologico, ]

  has_many :questions
  has_and_belongs_to_many  :vigs
  has_many :vigs_test
  accepts_nested_attributes_for :questions


  TEST_CODE={"bartel"=>1,"lawton_and_brody"=>2,"mini_mental"=>3,"yesavage"=>4,"oars"=>5,"tinetti"=>6,"hamilton"=>7,"nursing"=>8,"dimmy"=>9,zarit: 11}

end
