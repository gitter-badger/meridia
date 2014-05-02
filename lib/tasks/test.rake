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

			# if option exist check if the key group exits
			if options && options.has_key?(:group)
							questions_ = questions_.merge(group: options[:group])
			end
      #add question if the type is section
      if type  == 'section' && !options[:questions].nil?

        questions_["questions_attributes" ] = {}
        options[:questions].each_with_index do |q, key|
          questions_["questions_attributes"][key] = q.except :answers

          if q[:type] && !q[:answers].nil?
            questions_["questions_attributes"][key]["options_answers_attributes"] = {}
            q[:answers].each_with_index do |o,index|
              questions_["questions_attributes"][key]["options_answers_attributes"]["#{index}"]={"content"=>o["contentq"],"points"=>o["point"],"description"=>o["desc"]}
            end
          end
          
        end
      elsif type == 'check' && !options[:answers].nil?
        questions_["options_answers_attributes"] = {}
        options[:answers].each_with_index do |o,index|
          questions_["options_answers_attributes"]["#{index}"]={"content"=>o["contentq"],"points"=>o["point"],"description"=>o["desc"]}
        end
      elsif type == 'nested' && !options[:answers].nil?
        # Save the question
        questions_["questions_attributes" ] = {}
        questions_["options_answers_attributes"] = {}

        options[:answers].each_with_index do |option, i| 
          #puts 'ANSWER'

          questions_["options_answers_attributes"][i] = {content:option["contentq"], points: option["point"], description:option["desc"]}
          if option["questions"].nil?
            
            #save only the option
            questions_["options_answers_attributes"][i] = questions_["options_answers_attributes"][i].merge({isnested:false})

          else
            questions_["options_answers_attributes"][i] = questions_["options_answers_attributes"][i].merge({isnested:true})
            
            #save nested questions
            option["questions"].each_with_index do |q, j|
              questions_["questions_attributes"][j] = q.except( :answers, :questions )
              case q[:type]
              when 'section'
                questions_["questions_attributes"][j]["questions_attributes"] = {}
                q[:questions].each_with_index do |nq, k|
                  questions_["questions_attributes"][j]["questions_attributes"][k] = nq
                end
              else 
                questions_["questions_attributes"][j]["options_answers_attributes"] = {}
                q[:answers].each_with_index do |a, l|
                  questions_["questions_attributes"][j]["options_answers_attributes"][l] = {content:a["contentq"], points: a["point"], description:""}
                end
              end
            end

          end
        end
      end

      #puts questions_
      test.questions <<  Question.create(questions_)

    end

    def bartel
      test = Test.new(title: "ÍNDICE DE BARTHEL", calculate: :average, test_code: 1 )
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
      test = Test.new(title: "BREVE HISTORIA PERSONAL", calculate: nil, test_code: 2 )
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

    def dummy_funcionality
      test = Test.new(title: "Dummy de la Funcionalidad", calculate: :average, test_code: 3 )
      test.save!
      
      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"orientación/cognición" ,"check", answers: options)
      
      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Vista" ,"check", answers: options)
      
      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Oído" ,"check", answers: options)
      
      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Habla" ,"check", answers: options)
      
      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Depresión/Ansiedad" ,"check", answers: options)
      
      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Actividad Social" ,"check", answers: options)
      
      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Alimentación" ,"check", answers: options)
      
      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Continencia Urinaria" ,"check", answers: options)
      
      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Continencia Fecal" ,"check", answers: options)
      
      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Ducha/Baño" ,"check", answers: options)
      
      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Marcha" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Ayudas Técnicas" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Subir/Bajar Escaleras" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Transferencias" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Tareas Domésticas" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Vestido" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Arreglo Personal" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Independiente","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 2, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 3, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 4, "desc" => "blue"}
      test_build(test,"Aseo" ,"check", answers: options)
    end

    def oars_social
      test = Test.new(title: "OARS Social",test_code:4 )
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

    def index_lawton_and_brody
      test = Test.new(title: "ÍNDICE DE LAWTON & BRODY", calculate: :sum,test_code: 5 )
      test.save!

      options= Array.new
      options << {"contentq"=> "Utiliza el teléfono por iniciativa propia y sin ayuda.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Marca números bien conocidos","point" => 1, "desc" => ""}
      options << {"contentq"=> "contesta al teléfono pero no marca.","point" => 1, "desc" => ""}
      options << {"contentq"=> "No usa el teléfono en absoluto.","point" => 0, "desc" => ""}
      test_build(test,"Capacidad para usar el teléfono" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Realiza todas las compras necesarias sin ayuda.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Compra pequeñas cosas.","point" => 0, "desc" => ""}
      options << {"contentq"=> "Necesita compañía para realizar cualquier compra.","point" => 0, "desc" => ""}
      options << {"contentq"=> "Es incapaz de ir de compras.","point" => 0, "desc" => ""}
      test_build(test,"Ir de compras" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Planea, prepara y sirve sin ayuda las comidas adecuadas.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Prepara las comidas si le proporcionan los ingredientes.","point" => 0, "desc" => ""}
      options << {"contentq"=> "Prepara la comida, pero no mantiene una dieta adecuada.","point" => 0, "desc" => ""}
      options << {"contentq"=> "Necesita que se le prepare la comida.","point" => 0, "desc" => ""}
      test_build(test,"Preparación de la comida" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Cuida la casa sin ayuda o ésta es ocasional.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Realiza tareas domésticas ligeras.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Realiza tareas domésticas pero no mantiene un nivel de limpieza aceptable.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Necesita ayuda en todas las tareas de la casa.","point" => 0, "desc" => ""}
      options << {"contentq"=> "No participa en ninguna tarea domestica.","point" => 0, "desc" => ""}
      test_build(test,"Cuidar la casa" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Lo realiza sin ayuda.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Lava o aclara algunas prendas.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Necesita que otro se ocupe de todo el lavado.","point" => 0, "desc" => ""}
      test_build(test,"Lavado de la ropa" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "Viaja de forma independiente.","point" => 1, "desc" => ""}
      options << {"contentq"=> "No usa transporte público, salvo taxis.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Viaja en transporte público si le acompaña otra persona.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Viaja en taxi o automóvil solamente con la ayuda de otros.","point" => 0, "desc" => ""}
      options << {"contentq"=> "No viaja en lo absoluto.","point" => 0, "desc" => ""}
      test_build(test,"Medio de transporte" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "No precisa ayuda para tomar correctamente la medicación","point" => 1, "desc" => ""}
      options << {"contentq"=> "Necesita que le sean preparadas las dosis o las pastillas.","point" => 0, "desc" => ""}
      options << {"contentq"=> "No es capaz de responsabilizarse de su propia medicación.","point" => 0, "desc" => ""}
      test_build(test,"Responsabilidad sobre la medicación" ,"check", answers: options)

      options= Array.new
      options << {"contentq"=> "No precisa ayuda para manejar dinero ni llevar cuentas.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Necesita ayuda para ir al banco para grades gastos.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Incapaz de manejar dinero.","point" => 0, "desc" => ""}
      test_build(test,"Capacidad para utilizar el dinero" ,"check", answers: options)
    end

    def mini_mental
      test = Test.new(title: "MINI-MENTAL STATE EXAMINATION (MMSE)", test_code: 6)
      test.save!

      #
      questions = Array.new

      options= Array.new
      options << {"contentq"=> "Si","point" => 5, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Lugar y fecha de nacimiento. Edad:', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 5, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: '¿Dónde está Ud. ahora? (domicilio, lugar, hospital, ciudad, país)', type: 'check', answers: options }

      test_build( test, "Orientación", "section", questions: questions )
      
      #
      questions = Array.new

      options= Array.new
      options << {"contentq"=> "Si","point" => 3, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Nombrar tres objetos lentamente. Ej. Casa, zapato, papel.', type: 'check', answers: options }

      test_build( test, "Registro.", "section", questions: questions )

      #
      questions = Array.new

      options= Array.new
      options << {"contentq"=> "Si","point" => 5, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Múltiplos de atrás hacia adelante.(93, 86, 79, 72, 85) - Deletrear de atrás hacia delante la palabra MUNDO.', type: 'check', answers: options }

      test_build( test, "Atención y cálculo.", "section", questions: questions )

      #
      questions = Array.new

      options= Array.new
      options << {"contentq"=> "Si","point" => 3, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Repetir los objetos nombrados anteriormente (casa, zapato, papel)', type: 'check', answers: options }

      test_build( test, "Memoria", "section", questions: questions )
      
      #
      questions = Array.new

      options= Array.new
      options << {"contentq"=> "Si","point" => 2, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Mostrar un lápiz y un reloj, preguntar sus respectivos nombres.', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Repetir: tres perros en un trigal.', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 3, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Indicar: Tome el papel con su mano derecha, dóblelo a la mitad y póngalo en el suelo.', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Lea  y realice lo  siguiente: -CIERRE LOS OJOS-', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Escriba una oración, enunciado o frece.', type: 'check', answers: options }

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      questions << { content: 'Copie este dibujo.', type: 'check', answers: options }

      test_build( test, "Lenguaje", "section", questions: questions )
    end

    def yesavage
      test = Test.new(title: "ESCALA DE YESAVAGE (Versión reducida)", calculate: :sum, test_code:7)
      test.save!

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Está satisfecho con su vida?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Ha dejado de hacer actividades?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Siente que su vida está vacía?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Se encuentra a menudo aburrido(a)?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Se siente contento(a) la mayor parte del tiempo?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Teme que algo malo le pase?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Se siente feliz muchas veces?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Se siente a menudo abandonado?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Prefiere quedarse en casa que  salir a hacer cosas nuevas?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Cree tener más problemas de memoria que la mayoría de la gente?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Piensa que es maravilloso vivir?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Le cuesta realizar nuevas actividades?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Le cuesta realizar nuevas actividades?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Siente que su situación es desesperada?" ,"check", answers: options )

      options= Array.new
      options << {"contentq"=> "Si","point" => 1, "desc" => ""}
      options << {"contentq"=> "No","point" => 0, "desc" => ""}
      test_build(test,"¿Cree que mucha gente está mejor que usted?" ,"check", answers: options )
    end

    def tinetti
      test = Test.new(title: "ESCALA DE TINETTI", calculate: :sum, test_code:8 )
      test.save!

      # question 1
      options= Array.new
      options << {"contentq"=> "Se inclina o se desliza en la silla","point" => 0, "desc" => ""}
      options << {"contentq"=> "Se mantiene seguro","point" => 0, "desc" => ""}
      test_build(test,"Equilibrio sentado" ,"check", answers: options )

      # question 2
      options= Array.new
      options << {"contentq"=> "Imposible sin ayuda","point" => 0, "desc" => ""}
      options << {"contentq"=> "Capaz, pero usa los brazos para ayudarse","point" => 1, "desc" => ""}
      options << {"contentq"=> "Capaz sin usar los brazos","point" => 2, "desc" => ""}
      test_build(test,"Levantarse" ,"check", answers: options )
      
      # question 3
      options= Array.new
      options << {"contentq"=> "Incapaz sin ayuda","point" => 0, "desc" => ""}
      options << {"contentq"=> "Capaz, pero necesita más de un intento","point" => 1, "desc" => ""}
      options << {"contentq"=> "Capaz de levantarse con sólo un intento","point" => 2, "desc" => ""}
      test_build(test,"Intentos para levantarse" ,"check", answers: options )
      #
      # question 4
      options= Array.new
      options << {"contentq"=> "Inestable (se tambalea, mueve los pies), marcado balanceo del tronco","point" => 0, "desc" => ""}
      options << {"contentq"=> "Estable pero usa el andador, bastón o se agarra a otro objeto para mantenerse","point" => 1, "desc" => ""}
      options << {"contentq"=> "Estable sin andador, bastón u otros soportes","point" => 2, "desc" => ""}
      test_build(test,"Equilibrio en bipedestación inmediata (los primeros 5 segundos)" ,"check", answers: options )
      #
      # question 5
      options= Array.new
      options << {"contentq"=> "Inestable","point" => 0, "desc" => ""}
      options << {"contentq"=> "Estable, pero con apoyo amplio (talones separados más de 10 cm) o un bastón u otro soporte","point" => 1, "desc" => ""}
      options << {"contentq"=> "Estable sin usar bastón u otros soportes por 10 segundos, no requiere ayudas","point" => 2, "desc" => ""}
      test_build(test,"Equilibrio en bipedestación" ,"check", answers: options )
      #
      # question 6
      options= Array.new
      options << {"contentq"=> "Empieza a caerse","point" => 0, "desc" => ""}
      options << {"contentq"=> "Se tambalea, se agarra, pero se mantiene","point" => 1, "desc" => ""}
      options << {"contentq"=> "Estable","point" => 2, "desc" => ""}
      test_build(test,"6. Empujar (el paciente en bipedestación con el tronco erecto y los pies tan juntos como sea posible). El examinador empuja suavemente en el esternón del paciente con la palma de la mano, tres veces (sin prevenirlo). Asegúrese que un evaluador esté detrás de la persona para evitar caída." ,"check", answers: options )
      #
      # question 7
      options= Array.new
      options << {"contentq"=> "Inestable","point" => 0, "desc" => ""}
      options << {"contentq"=> "Estable","point" => 1, "desc" => ""}
      test_build(test,"Ojos cerrados (en la posición del punto 6)" ,"check", answers: options )
      #
      # question 8
      options= Array.new
      options << {"contentq"=> "Pasos discontinuos","point" => 0, "desc" => ""}
      options << {"contentq"=> "Continuos.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Inestable (se tambalea, se agarra)","point" => 1, "desc" => ""}
      options << {"contentq"=> "Estable","point" => 0, "desc" => ""}
      test_build(test,"Vuelta de 360 grados sobre su propio eje" ,"check", answers: options )
      # 
      # question 9
      options= Array.new
      options << {"contentq"=> "Inseguro, calcula mal la distancia, cae en la silla","point" => 0, "desc" => ""}
      options << {"contentq"=> "Usa los brazos o el movimiento es brusco","point" => 1, "desc" => ""}
      options << {"contentq"=> "Seguro, movimiento suave","point" => 2, "desc" => ""}
      test_build(test,"Sentarse" ,"check", answers: options )
      #
      # question 10
      options= Array.new
      options << {"contentq"=> "Algunas vacilaciones o múltiples intentos para empezar","point" => 0, "desc" => ""}
      options << {"contentq"=> "No vacila","point" => 1, "desc" => ""}
      test_build(test,"Iniciación de la marcha (inmediatamente después de decir que ande)" ,"check", answers: options )
      #
      # question 11
      options= Array.new
      options << {"contentq"=> "No sobrepasa al pie izquierdo con el paso","point" => 0, "desc" => ""}
      options << {"contentq"=> "Sobrepasa al pie izquierdo","point" => 0, "desc" => ""}
      options << {"contentq"=> "El pie derecho, no se separa completamente del suelo con el paso","point" => 0, "desc" => ""}
      options << {"contentq"=> "El pie derecho, se separa completamente del suelo","point" => 1, "desc" => ""}
      test_build(test,"Longitud y altura de paso a) Movimiento del pie derecho" ,"check", answers: options )
      #
      # question 11
      options= Array.new
      options << {"contentq"=> "No sobrepasa al pie derecho, con el paso","point" => 0, "desc" => ""}
      options << {"contentq"=> "Sobrepasa al pie derecho","point" => 1, "desc" => ""}
      options << {"contentq"=> "El pie izquierdo, no se separa completamente del suelo con el paso","point" => 0, "desc" => ""}
      options << {"contentq"=> "El pie izquierdo, se separa completamente del suelo","point" => 1, "desc" => ""}
      test_build(test,"b) Movimiento del pie izquierdo" ,"check", answers: options )
      # 
      # question 12
      options= Array.new
      options << {"contentq"=> "La longitud de los pasos con los pies izquierdo y derecho, no es igual","point" => 0, "desc" => ""}
      options << {"contentq"=> "La longitud parece igual","point" => 1, "desc" => ""}
      test_build(test,"Simetría del paso" ,"check", answers: options )
      #
      # question 13
      options= Array.new
      options << {"contentq"=> "Paradas entre los pasos","point" => 0, "desc" => ""}
      options << {"contentq"=> "Los pasos parecen continuos","point" => 1, "desc" => ""}
      test_build(test,"Fluidez del paso" ,"check", answers: options )
      #
      # question 14
      options= Array.new
      options << {"contentq"=> "Desviación grave de la trayectoria","point" => 0, "desc" => ""}
      options << {"contentq"=> "Leve/moderada desviación o usa ayudas para mantener la trayectoria","point" => 1, "desc" => ""}
      options << {"contentq"=> "Sin desviación o ayudas","point" => 2, "desc" => ""}
      test_build(test,"Trayectoria (observar el trazado que realiza uno de los pies durante unos 3 metros)" ,"check", answers: options )
      #
      # question 15
      options= Array.new
      options << {"contentq"=> "Balanceo marcado o usa ayudas","point" => 0, "desc" => ""}
      options << {"contentq"=> "No se balancea pero flexiona las rodillas o la espalda o separa los brazos al caminar","point" => 1, "desc" => ""}
      options << {"contentq"=> "No se balancea, no se flexiona, ni utiliza otras ayudas","point" => 2, "desc" => ""}
      test_build(test,"Tronco" ,"check", answers: options )
      #
      # question 16
      options= Array.new
      options << {"contentq"=> "Talones separados","point" => 0, "desc" => ""}
      options << {"contentq"=> "Talones casi juntos al caminar","point" => 1, "desc" => ""}
      test_build(test,"Postura al caminar" ,"check", answers: options )

    end

    def hamilton
      test = Test.new(title: "ESCALA DE ANSIEDAD DE HAMILTON", calculate: "hamilton" )
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


    bartel
    personal_history
    dummy_funcionality
    index_lawton_and_brody
    mini_mental
    yesavage
    oars_social
    tinetti
    hamilton
  end
end
