require 'modules/build_test'

class Oars
  include BuildTest
    def self.test
      test = Test.new(title: "OARS Social",calculate: :oars,code:5 )
      test.save!

      # question 1
      options= Array.new
      options << {"contentq"=> "Soltero","point" => 1, "desc" => ""}
      options << {"contentq"=> "Casado/a","point" => 1, "desc" => ""}
      options << {"contentq"=> "Viudo/a","point" => 1, "desc" => ""}
      options << {"contentq"=> "Divorciado/a","point" => 1, "desc" => ""}
      options << {"contentq"=> "Separado/a","point" => 1, "desc" => ""}
      options << {"contentq"=> "No contesta","point" => 0, "desc" => ""}
      test_build(test,"¿Su estado civil es?:" ,"check", answers: options)

      # question 2
      questions = Array.new

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Nadie', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Esposo/a', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Hijos', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Nietos', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Padres', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Otros', type: 'checkother', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Hermanos/as', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Otros familiares', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Amigos/as', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Cuidadores pagados.', type: 'check', answers: options }

      test_build( test, "¿Quién vive con usted?", "section", questions: questions )

      # question 3
      options= Array.new
      options << {"contentq"=> "mayor 5","point" => 3, "desc" => ""}
      options << {"contentq"=> "3-4","point" => 2, "desc" => ""}
      options << {"contentq"=> "Una vez","point" => 1, "desc" => ""}
      options << {"contentq"=> "Ninguna","point" => 0, "desc" => ""}
      options << {"contentq"=> "No responde","point" => 0, "desc" => ""}
      test_build(test,"¿Cuántas personas conocen suficientemente bien como para visitarlas en su casa?" ,"check", answers: options)

      # question 4
      options= Array.new
      options << {"contentq"=> "Una vez al día o más","point" => 3, "desc" => ""}
      options << {"contentq"=> "2-6 veces","point" => 2, "desc" => ""}
      options << {"contentq"=> "Una vez","point" => 1, "desc" => ""}
      options << {"contentq"=> "Ninguna","point" => 0, "desc" => ""}
      options << {"contentq"=> "No responde","point" => 0, "desc" => ""}
      test_build(test,"¿Cuántas veces ha hablado por teléfono con amigos y/o familiares en la última semana?" ,"check", answers: options)

      #question 5
      options= Array.new
      options << {"contentq"=> "Una vez al día o más","point" => 3, "desc" => ""}
      options << {"contentq"=> "2-6 veces/semana","point" => 2, "desc" => ""}
      options << {"contentq"=> "Una vez","point" => 1, "desc" => ""}
      options << {"contentq"=> "Ninguna","point" => 0, "desc" => ""}
      options << {"contentq"=> "No responde","point" => 0, "desc" => ""}
      test_build(test,"¿Cuántas veces durante la semana pasada ha visto a personas que no viven con usted? (visitas, etc.)" ,"check", answers: options)

      # question 6
      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      options << {"contentq"=> "No responde","point" => 0, "desc" => ""}
      test_build(test,"¿Tiene usted alguna persona en quien confiar?" ,"check", answers: options)

      # question 7
      options= Array.new
      options << {"contentq"=> "Casi nunca","point" => 1, "desc" => ""}
      options << {"contentq"=> "Algunas veces","point" => 1, "desc" => ""}
      options << {"contentq"=> "A menudo","point" => 0, "desc" => ""}
      options << {"contentq"=> "No responde","point" => 0, "desc" => ""}
      test_build(test,"¿Se encuentra solo o se siente en soledad?" ,"check", answers: options)

      # question 8
      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      options << {"contentq"=> "No responde","point" => 0, "desc" => ""}
      test_build(test,"¿Ve usted a sus amigos y familiares tan a menudo como a usted le gustaría?" ,"check", answers: options)

      # question 9
      questions = Array.new

      options= Array.new
      options << {"contentq"=> "De forma indefinida","point" => 1, "desc" => "De forma indefinida"}
      options << {"contentq"=> "Durante un corto período de tiempo (semanas o 6 meses)","point" => 2, "desc" => "Durante un corto período de tiempo (semanas o 6 meses)"}
      options << {"contentq"=> "Sólo de forma pasajera (para ir al médico, a comer, etc.)","point" => 3, "desc" => "Sólo de forma pasajera (para ir al médico, a comer, etc.)"}
      questions << { content: 'Sí ha contestado Sí: ¿Esa persona cuidaría de usted?', type: 'check', answers: options }

      section_questions = Array.new
      section_questions << { content: 'Nombre:', type: 'text' }
      section_questions << { content: 'Relación:', type: 'text' }
      questions << { content: "¿Quién es esa persona?", type: "section", questions: section_questions }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => "", "questions" => questions }
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Si alguna vez necesitase usted ayuda por encontrarse incapacitado, tendría quien le prestase esa ayuda?" ,"nested", answers: options )

    end



end
