class Deposition < Evaluation

  LEVELS = [
    [ "Patron", [ [ "Incontinencia", 0 ], [ "Retencion", 1 ], [ "Sin Alteraciones", 2 ] ] ],
    [ "Frecuencia", [ [ "1-2 dias", 1 ], [ "3-5 dias", 2 ], [ "6 dias", 3 ] ] ],
    [ "Alteraciones", [ ["Coluria", 0], ["Disuria", 1], ["Nicturia", 2], [ "Hematuria", 3] ] ],
    [ "Movimiento Intestinal en los 4 cuadrantes", "radio", [ [ "Si", 1 ], [ "No", 0 ] ] ],
    [ "Patron", [ [ "Diarrea", 0 ], [ "Estrenimiento", 1 ], [ "Incontinencia", 2 ], [ "Sin Alteraciones", 3 ] ] ],
    [ "Frecuencia", [ ["Diario", 1], ["2-3 Dias", 2], [ "3 dias", 3 ] ] ],
    [ "Caracteristicas", [ ["Bien Formada", 0], ["Pastosa", 1], ["Semiliquida", 2], ["Sin Alteraciones", 3], ["Liquida", 4] ] ],
    [ "Uso de Laxantes y Otros", [ ["Si", 1], ["No", 0] ], "cual?" ],
    [ "Sonda U Ostomia", [ ["Si", 1], ["No", 0] ], "cual?" ],
    [ "Sudoracion", [ ["Excesiva", 1], ["Regular", 2], ["Escasa", 3] ] ],
    [ "Movilizacion", "radio", [ ["Autosuficiente", 1], ["Bano-Higiene", 2], ["Uso de WC", 3], ["Vestido", 4], ["Deambulacion", 5] ]  ],
    [ "Miembro Dominante", "radio", [ ["Derecho", 1], ["Izquierdo", 2 ] ] ],
    [ "Dispositivos", "radio", [ ["No require", 1], ["Andadera", 2], ["Aparato Ortopedico", 3], ["Baston", 4], ["Retrete", 5], ["Otro", 6] ] ],
    [ "Preferencia Hora de Bano", "radio", [ ["Matutino", 1], ["Vespertino", 2], ["Nocturno", 3] ] ],
    [ "Frecuencia de lavado de Cabello", "radio", [ ["Diario", 1], ["Cada 3er dia", 2], ["otro", 3] ] ],
    [ "Frecuencia de lavado de dientes", "radio", [ ["1 dia", 1], ["2 dia", 2], ["3 dia", 3] ] ],
    [ "Comunicacion", "radio", [ ["Dificultad para ver", 1], ["Dificultad para oir", 2], ["Dificultad para hablar", 3], ["Ninguna de las anteriores", 4], ["Usa protesis auditiva", 5], ["Usa lentes de contacto", 6], ["Usa anteojos", 7] ] ],
    [ "Horas de sueno", "radio", [ ["<6 horas", 1], ["de 6 a 8 horas", 2], ["> 8 horas"] ] ],
    [ "Aconstumbra a dormir siesta", "radio", [ ["Si", 1], ["No", 0 ] ] ],
    [ "Patron de sueno", "radio", [ ["Continuo", 1], ["Discontinuo", 2] ]  ],
    [ "Toma algun medicamento para domir?", "radio", [ ["Si", 1], ["No", 0 ] ] ],
    [ "Utiliza alguna otra medida para inducir el sueno", "radio", [ ["No", 0 ], [ "Si", 1 ] ] ],
    [ "En las ultimas 24 horas ha experimentado algun dolor?", "radio", [ ["Si", 1], ["No", 0] ] ],
    [ "Que situacion hace que se aumente el dolor?", "text" ],
    [ "Que le ayudo a eliminarlo?", "text" ],
    [ "En una escala del 0 al 10 como lo evalua?", "radio", [ ["1", 1], ["2", 2], ["3", 3], ["4", 4], ["5", 5], ["6", 6 ], ["7", 7], ["8", 8], ["9", 9], ["10", 10] ] ],
    [ "El dolor lo considera como?", "radio", [ ["Leve", 1], ["Moderado", 2], ["Severo", 3] ] ]
  ]

  field :levels, type: Array, default: []

  field :urinary_pattern, type: Integer, default: 0
  field :urinary_frequency, type: Integer, default: 1
  field :urinary_alterations, type: Integer, default: 0

  field :intestinal_movement, type: Integer, default: 0
  field :intestinal_pattern, type: Integer, default: 0
  field :intestinal_frequency, type: Integer, default: 1
  field :intestinal_characteristics, type: Integer, default: 0
  field :laxatives, type: Integer, default: 0
  field :laxatives_note, type: String, default: nil

  field :catheter_or_ostomy, type: Integer, default: 0
  field :catheter_or_ostomy_note, type: String, default: nil

  field :sweating, type: Integer, default: 1

  belongs_to :member
end
