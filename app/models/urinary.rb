class Urinary
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Enum

  LEVELS = [
    [ "Patron", "radio", [ [ "Incontinencia", 1 ], [ "Retencion", 2 ], [ "Sin Alteraciones", 3 ] ] ],
    [ "Frecuencia", "radio", [ [ "1-2 dias", 1 ], [ "3-5 dias", 2 ], [ "6 dias", 3 ] ] ],
    [ "Alteraciones", "radio", [ ["Coluria", 1], ["Disuria", 2], ["Nicturia", 3], [ "Hematuria", 4] ] ],
    [ "Movimiento Intestinal en los 4 cuadrantes", "radio", [ [ "Si", 1 ], [ "No", 0 ] ] ],
    [ "Patron", "radio", [ [ "Diarrea", 1 ], [ "Estrenimiento", 2 ], [ "Incontinencia", 3 ], [ "Sin Alteraciones", 4 ] ] ],
    [ "Frecuencia", "radio", [ ["Diario", 1], ["2-3 Dias", 2], [ "3 dias", 3 ] ] ],
    [ "Caracteristicas", "radio", [ ["Bien Formada", 1], ["Pastosa", 2], ["Semiliquida", 3], ["Sin Alteraciones", 4], ["Liquida", 5] ] ],
    [ "Uso de Laxantes y Otros", "radio", [ ["Si", 1], ["No", 0] ], "cual?" ],
    [ "Sonda U Ostomia", "radio", [ ["Si", 1], ["No", 0] ], "cual?" ],
    [ "Sudoracion", "radio", [ ["Excesiva", 1], ["Regular", 2], ["Escasa", 3] ] ],
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

  embedded_in :member
end
