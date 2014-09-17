require 'modules/build_test'
class Mmse
  include BuildTest
    def self.test 
      test = Test.new(title: "BREVE HISTORIA PERSONAL", calculate: nil, code: Test::TYPE["personal"] )
      test.save!

      questions = Array.new
      questions << { content: 'Lugar y fecha de nacimiento. Edad:', type: 'text' }
      questions << { content: '¿Qué recuerda de su infancia y a qué le gustaba jugar?', type: 'text' }
      questions << { content: 'Lugares donde ha vivido:', type: 'text' }
      questions << { content: '¿Qué estudió?', type: 'text' }
      questions << { content: 'Ocupación actual: Ocupación anterior:', type: 'text' }
      questions << { content: 'Breve Historia (boda, hijos, viajes, etc.):', type: 'text' }
      questions << { content: 'Religión:', type: 'text' }
      
      test_build( test, "Breve biografía", "section", questions: questions )

      questions = Array.new
      questions << { content: '¿Qué realiza (ba) en su tiempo libre? ', type: 'text' }
      questions << { content: 'Deportes o actividades favoritas:', type: 'text' }
      questions << { content: 'Programas de TV favoritos:', type: 'text' }
      
      test_build( test, "Aficiones:", "section", questions: questions )

      questions = Array.new
      questions << { content: '¿Qué música le gusta?:', type: 'text' }
      questions << { content: 'Culturas o civilizaciones de interés:', type: 'text' }
      questions << { content: '¿Qué artes le gustan más?', type: 'text' }
      questions << { content: 'Tipo de películas :', type: 'text' }
      questions << { content: 'Tipo de lectura:', type: 'text' }
      questions << { content: 'Otros:', type: 'text' }
      
      test_build( test, "Cultura: ", "section", questions: questions )

      questions = Array.new
      questions << { content: '¿Qué comida le gusta más? ', type: 'text' }
      questions << { content: '3 cosas que le gusten mucho:', type: 'text' }
      questions << { content: '3 cosas que no le gusten:', type: 'text' }
      questions << { content: '¿Qué le pone alegre?:', type: 'text' }
      questions << { content: '¿Qué temas le gustan para conversar?:', type: 'text' }
      questions << { content: 'Otros:', type: 'text' }
      
      test_build( test, "Gustos personales: ", "section", questions: questions )

      questions = Array.new
      questions << { content: '¿Ha notado algún cambio importante  en el estado de ánimo del mayor?', type: 'text' }
      questions << { content: '¿Ha tenido pérdidas  recientemente? ', type: 'text' }
      
      test_build( test, "Estado de ánimo:", "section", questions: questions )

      test_build( test, "¿Qué espera de los servicios que ofrece Meridia? ", "textarea" )
      #test_build(test,"Breve Historia (boda, hijos, viajes, etc.)" ,"text" )
      #test_build(test,"Religión" ,"text" )
    end


end
