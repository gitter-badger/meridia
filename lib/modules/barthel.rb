require 'modules/build_test'

class Barthel
  include BuildTest
  
  def self.test
      test = Test.new(title: "ÍNDICE DE BARTHEL", calculate: :abvd, code: 1 )
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
end
