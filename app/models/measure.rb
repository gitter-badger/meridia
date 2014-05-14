class Measure
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Attributes::Dynamic
  include Mongoid::Enum

  LEVELS = {
    ta: "Tension Arterial",
    fc: "Frecuencia Cardiaca",
    fr: "Frecuencia Respiratoria",
    temp: "Temperatura",
    o2: "Oxigeno",
    glucose: "Glucosa",
    weight: "Peso",
    height: "Altura"
  }

  enum :kindof, [:ta, :fc, :fr, :temp, :o2, :glucose, :weight, :height]
  field :value, type: Integer, default: 0

  embedded_in :sign
end
