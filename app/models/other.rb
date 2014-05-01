class Other
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Enum

  SIGNS = [
    [ "Edema", [ [ "Si", 1 ], [ "No", 0 ] ], [ [ "Leve", 1 ], [ "Moderado", 2 ] ] ],
    [ "Llenado Capilar", [ [ "< seg", 1 ], [ "> seg", 2 ] ] ]
  ]

  field :signs, type: Array, default: []

  embedded_in :member
end
