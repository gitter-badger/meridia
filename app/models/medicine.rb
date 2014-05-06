class Medicine
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum


  field :name, type: String
  field :frequency, type: Integer, default: 1
  field :dose, type: Integer, default: 1
  field :way, type: String
  field :validity, type: String
  enum :day, [ :monday, :tuesday, :wednesday, :thursday, :friday ], { :multiple => true , :default => [ :monday ]  }

  #embedded_in :member
  belongs_to :member
end
