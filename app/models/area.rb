class Area
  include Mongoid::Document
  include Mongoid::Enum

  enum :kindof, [:health,:cognitive, :physical, :personaldev, :social]
  #enum :level, [ :basic, :intermediate, :advanced ], { :multiple => true, :default => [] }

   has_and_belongs_to_many :activities

end
