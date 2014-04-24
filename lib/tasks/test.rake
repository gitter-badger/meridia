namespace :test do
  desc "test"

  task :setup_test=> :environment do
    #questions_bartel = Hash.new
    #@questions = Array.new

    def test_build(test, q_content, type, options = false) 
      questions_= {
        "content" => q_content,
        "type" => type
      }

      puts 'type'
      puts type
      puts 'options'
      puts options

      #add question if the type is section
      if type  == 'section' && !options[:questions].nil?

        questions_["questions_attributes" ] = {}
        options[:questions].each_with_index do |q, key|
          questions_["questions_attributes"][key] = q
        end
      elsif type == 'check' && !options[:answers].nil?
        questions_["options_answers_attributes"] = {}
        options[:answers].each_with_index do |o,index|
          questions_["options_answers_attributes"]["#{index}"]={"content"=>o["contentq"],"points"=>o["point"],"description"=>o["desc"]}
        end
      end
      test.questions <<  Question.create(questions_)

      #added options to questions hash
      #unless !options
      #  questions_["options_answers_attributes"] = {}
      #  options.each_with_index do |o,index|
      #  questions_["options_answers_attributes"]["#{index}"]={"content"=>o["contentq"],"points"=>o["point"],"description"=>o["desc"]}
      #  end
      #end

      #p test.questions
      #options = []
    end

    def bartel
      test = Test.new(title: "ÍNDICE DE BARTHEL")
      test.save!


      options= Array.new
      options << {"contentq"=> "Independiente","point" => 10, "desc" => "Capaz de comer por sí solo en un tiempo razonable. La  comida puede ser cocinada y servida por otra persona"}
      options << {"contentq"=> "Necesita ayuda ","point" => 5, "desc" => "Para cortar la carne, extender la mantequilla... pero es capaz de comer sólo
        "}
      options << {"contentq"=> "Dependiente ","point" => 0, "desc" => "Necesita ser alimentado por otra persona"}				
      test_build(test,"COMIDA" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 5, "desc" => "Capaz de lavarse completo, de entrar y salir del baño sin ayuda y de hacerlo sin que una persona supervise"}
      options << {"contentq"=> "Dependiente ","point" => 0, "desc" => "Necesita algún tipo de ayuda o supervisión"}				
      test_build(test,"LAVADO DUCHA" ,"check", answers: options )			

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 5, "desc" => "Realiza todas las actividades personales sin ayuda alguna, los complementos necesarios pueden ser provistos por alguna persona"}
      options << {"contentq"=> "Dependiente ","point" => 0, "desc" => "Necesita ayuda"}				
      test_build(test,"ARREGLO PERSONAL" ,"check", answers: options)		

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 10, "desc" => "No presenta episodios de incontinencia"}
      options << {"contentq"=> "Necesita ayuda ","point" => 5, "desc" => "Menos de una vez por semana o necesita ayuda  para colocar enemas o supositorios"}
      options << {"contentq"=> "Dependiente ","point" => 0, "desc" => "Más de un episodio semanal"}				
      test_build(test,"DEPOSICIÓN" ,"check", answers: options)	

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 10, "desc" => "No presenta episodios. Capaz de utilizar cualquier dispositivo por sí solo (botella, sonda, orinal... )."}
      options << {"contentq"=> "Necesita ayuda ","point" => 5, "desc" => "Presenta un máximo de un episodio en 24 horas o requiere ayuda para la manipulación de sondas o de otros dispositivos."}
      options << {"contentq"=> "Dependiente ","point" => 0, "desc" => "Más de un episodio en 24 horas"}				
      test_build(test,"MICCIÓN" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 10, "desc" => "Entra y sale solo y no necesita ayuda alguna por parte de otra persona"}
      options << {"contentq"=> "Necesita ayuda ","point" => 5, "desc" => "Capaz de manejarse con una pequeña ayuda; es capaz de usar el cuarto de baño. Puede limpiarse solo"}
      options << {"contentq"=> "Dependiente ","point" => 0, "desc" => "Incapaz de acceder a él o de utilizarlo sin ayuda mayor"}				
      test_build(test,"IR AL W.C." ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 15, "desc" => "No requiere ayuda para sentarse o levantarse de una silla ni para entrar o salir de la cama."}
      options << {"contentq"=> "Mínima ayuda","point" => 10, "desc" => "Incluye una supervisión o una pequeña ayuda física."}
      options << {"contentq"=> "Gran ayuda.","point" => 5, "desc" => "Precisa ayuda de una persona fuerte o entrenada."}
      options << {"contentq"=> "Dependiente ","point" => 0, "desc" => "Necesita una grúa o el alzamiento por dos personas. Es incapaz de permanecer sentado"}				
      test_build(test,"TRANSFERENCIA Traslado cama/sillón" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 15, "desc" => "Puede andar 50 metros o su equivalente en casa sin ayuda supervisión. Puede utilizar cualquier ayuda mecánica excepto un andador. Si utiliza una prótesis, puede ponérsela y quitársela solo."}
      options << {"contentq"=> "Necesita ayuda.","point" => 10, "desc" => "Necesita supervisión o una pequeña ayuda física por parte de otra persona o utiliza andador."}
      options << {"contentq"=> "Independiente en silla de ruedas","point" => 5, "desc" => " No requiere ayuda ni supervisión"}
      test_build(test,"DEAMBULACIÓN" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 10, "desc" => "Capaz de subir y bajar un piso sin ayuda ni supervisión de otra persona"}
      options << {"contentq"=> "Necesita ayuda ","point" => 5, "desc" => "Necesita ayuda o supervisión."}
      options << {"contentq"=> "Dependiente ","point" => 0, "desc" => "Es incapaz de salvar escalones"}				
      test_build(test,"SUBIR Y BAJAR ESCALERAS" ,"check", answers: options)

    end	

    def personal_history 
      test = Test.new(title: "BREVE HISTORIA PERSONAL")
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


    bartel
    #personal_history

  end
end
