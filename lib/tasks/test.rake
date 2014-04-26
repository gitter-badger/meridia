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
      end

      puts questions_
      test.questions <<  Question.create(questions_)

    end

    def bartel
      test = Test.new(title: "ÍNDICE DE BARTHEL", calculate: :average )
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
      test = Test.new(title: "BREVE HISTORIA PERSONAL", calculate: nil )
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
      test = Test.new(title: "Dummy de la Funcionalidad", calculate: :average )
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
      test = Test.new(title: "OARS Social")
      test.save!

      options= Array.new
      options << {"contentq"=> "","point" => 1, "desc" => "white"}
      options << {"contentq"=> "Con ayuda","point" => 1, "desc" => "green"}
      options << {"contentq"=> "Necesita ayuda ","point" => 1, "desc" => "red"}
      options << {"contentq"=> "Dependiente ","point" => 1, "desc" => "blue"}
      test_build(test,"¿Su estado civil es?:" ,"check", answers: options)

    end

    def index_lawton_and_brody
      test = Test.new(title: "ÍNDICE DE LAWTON & BRODY", calculate: :sum )
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
      test = Test.new(title: "MINI-MENTAL STATE EXAMINATION (MMSE)")
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
      test = Test.new(title: "ESCALA DE YESAVAGE (Versión reducida)", calculate: :sum)
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


    #bartel
    #personal_history
    #dummy_funcionality
    #index_lawton_and_brody
    #mini_mental
    #yesavage
  end
end
