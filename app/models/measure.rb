class Measure
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Attributes::Dynamic
  include Mongoid::Enum

  enum :kindof, [:ta, :fc, :fr, :temp, :o2, :glucose, :weight, :height]
  field :value, type: String

  embedded_in :sign
end
