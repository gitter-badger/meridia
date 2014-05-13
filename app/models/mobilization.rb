class Mobilization < Evaluation

  LEVELS = [
    [ "Movilizacion", [ ["Autosuficiente", 1], ["Bano-Higiene", 2], ["Uso de WC", 3], [ "Vestido", 4], ["Deambulacion", 5] ]],
    [ "Miembro Dominante", [ ["Derecho", 1], ["Izquierdo", 2] ]],
    [ "Dispositivos", [ ["No requiere", 0], ["Andadera", 1], ["Aparato Ortopedico", 2], ["Baston", 3], ["Retrete", 4], ["Otro", 5] ]]
  ]
  field :mobilization, type: Integer, default: 1
  field :dominant_member, type: Integer, default: 1
  field :devices, type: Integer, default: 0

  belongs_to :member
end
