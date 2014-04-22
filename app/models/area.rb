class Area
  include Mongoid::Document
  include Mongoid::Enum

  enum :kindof, [:cognitive, :physical, :personaldev, :social]
  enum :level, [ :basic, :intermediate, :advanced ], { :multiple => true, :default => [] }

  embedded_in :activity

end
