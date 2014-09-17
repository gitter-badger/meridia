require 'modules/build_test'
class Hamilton
  include BuildTest
    def self.test
      test = Test.new(title: "ESCALA DE ANSIEDAD DE HAMILTON",code:7, calculate: :hamilton )
      test.save!
      #
      # question 1
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Estado ansioso: Inquietud. Expectativas de catástrofe. Preocupaciones, temores irritabilidad." ,"check", answers: options, group: 1  )
      #
      # question 2
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Tensión: Sensaciones de tensión. Fatiga. Incapacidad de relajarse. Reacciones de sobresalto. Llanto fácil. Temblores." ,"check", answers: options, group:1 )
      #
      # question 3
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Miedos o temores: A la oscuridad. A los desconocidos. A la soledad. A los animales. A la muchedumbre." ,"check", answers: options, group: 1 )
      #
      # question 4
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Insomnio: Dificultades de conciliación. Sueño interrumpido. Cansancio al despertar. Sueños penosos. Pesadillas. Terrores nocturnos." ,"check", answers: options,group:1 )
      #
      # question 5
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Funciones Intelectuales (Cognitivas): Dificultad de concentración. Falta de memoria." ,"check", answers: options, group:1 )
      #
      # question 6
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Estado de ánimo depresivo: Pérdida de interés. No disfruta del tiempo libre. Depresión. Humor diurno oscilante." ,"check", answers: options,group:1 )
      #
      # question 7
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Síntomas somáticos musculares: Dolores musculares. Rigidez muscular. Sacudidas musculares. Convulsiones clónicas. Rechinar de dientes. Voz quebrada." ,"check", answers: options, group:2 )
      #
      # question 8
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Síntomas somáticos generales: Acúfenos. Zumbido de oídos. Visión borrosa. Oleadas de calor o frio. Sensación de debilidad. Sensaciones parestésicas (pinchazos u hormigueos)." ,"check", answers: options, group:2 )
      #
      # question 9
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Síntomas cardiovasculares: Taquicardia. Palpitaciones. Dolor torácico. Sensación de desmayo o paro cardiaco." ,"check", answers: options, group:2 )
      #
      # question 10
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Síntomas respiratorios: Opresión o constricción torácica. Sensación de ahogo o falta de aire. Suspiros. Disnea (dificultad para respirar)." ,"check", answers: options, group:2 )
      #
      # question 11
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Síntomas gastrointestinales: Dificultades evacuatorias. Gases. Dispepsia: dolores antes o después de comer, ardor, hinchazón abdominal, nauseas, vómitos, constricción epigástrica. Cólicos (espasmos) abdominales. Diarrea. Pérdida de peso. Estreñimiento." ,"check", answers: options, group:2 )
      #
      # question 12
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Síntomas genitourinarios: Micciones frecuentes. Micción imperiosa. Metrorragia (hemorragia genital). Frigidez. Eyaculación precoz. Impotencia. Ausencia de erección." ,"check", answers: options, group:2 )
      #
      # question 13
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Síntomas del sistema nervioso autónomo: Boca seca. Palidez. Tendencia a la sudoración. Vértigos. Cefalea (dolor de cabeza) de tensión." ,"check", answers: options, group: 2 )
      #
      # question 14
      options= Array.new
      options << {"contentq"=> "0","point" => 0, "desc" => ""}
      options << {"contentq"=> "1","point" => 1, "desc" => ""}
      options << {"contentq"=> "2","point" => 2, "desc" => ""}
      options << {"contentq"=> "3","point" => 3, "desc" => ""}
      options << {"contentq"=> "4","point" => 4, "desc" => ""}
      test_build(test,"Conducta en el transcurso del test: Tendencia al abatimiento. Agitación: manos inquietas, cierra los puños, tics. Inquietud. Rostro preocupado. Palidez facial. Traga saliva. Eructos. Taquicardia o palpitaciones. Ritmo respiratorio acelerado. Sudoración." ,"check", answers: options ,group: 1)
    end


end

