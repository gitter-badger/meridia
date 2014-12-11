require 'modules/build_test'

class Lawton
  include BuildTest
    def self.test
      test = Test.new(title: "ÍNDICE DE LAWTON & BRODY", calculate: :aivd,code: 2 )
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


end
