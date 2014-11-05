require 'modules/build_test'
class Tinetti
  include BuildTest
    def self.test
      test = Test.new(title: "ESCALA DE TINETTI", calculate: :tinetti,code:6 )
      test.save!

      # question 1
      options= Array.new
      options << {"contentq"=> "Se inclina o se desliza en la silla","point" => 0, "desc" => ""}
      options << {"contentq"=> "Se mantiene seguro","point" => 0, "desc" => ""}
      test_build(test,"Equilibrio sentado" ,"check", answers: options, group: 1 )

      # question 2
      options= Array.new
      options << {"contentq"=> "Imposible sin ayuda","point" => 0, "desc" => ""}
      options << {"contentq"=> "Capaz, pero usa los brazos para ayudarse","point" => 1, "desc" => ""}
      options << {"contentq"=> "Capaz sin usar los brazos","point" => 2, "desc" => ""}
      test_build(test,"Levantarse" ,"check", answers: options, group: 1 )
      
      # question 3
      options= Array.new
      options << {"contentq"=> "Incapaz sin ayuda","point" => 0, "desc" => ""}
      options << {"contentq"=> "Capaz, pero necesita más de un intento","point" => 1, "desc" => ""}
      options << {"contentq"=> "Capaz de levantarse con sólo un intento","point" => 2, "desc" => ""}
      test_build(test,"Intentos para levantarse" ,"check", answers: options,  group: 1 )
      #
      # question 4
      options= Array.new
      options << {"contentq"=> "Inestable (se tambalea, mueve los pies), marcado balanceo del tronco","point" => 0, "desc" => ""}
      options << {"contentq"=> "Estable pero usa el andador, bastón o se agarra a otro objeto para mantenerse","point" => 1, "desc" => ""}
      options << {"contentq"=> "Estable sin andador, bastón u otros soportes","point" => 2, "desc" => ""}
      test_build(test,"Equilibrio en bipedestación inmediata (los primeros 5 segundos)" ,"check", answers: options, group: 1 )
      #
      # question 5
      options= Array.new
      options << {"contentq"=> "Inestable","point" => 0, "desc" => ""}
      options << {"contentq"=> "Estable, pero con apoyo amplio (talones separados más de 10 cm) o un bastón u otro soporte","point" => 1, "desc" => ""}
      options << {"contentq"=> "Estable sin usar bastón u otros soportes por 10 segundos, no requiere ayudas","point" => 2, "desc" => ""}
      test_build(test,"Equilibrio en bipedestación" ,"check", answers: options, group: 1 )
      #
      # question 6
      options= Array.new
      options << {"contentq"=> "Empieza a caerse","point" => 0, "desc" => ""}
      options << {"contentq"=> "Se tambalea, se agarra, pero se mantiene","point" => 1, "desc" => ""}
      options << {"contentq"=> "Estable","point" => 2, "desc" => ""}
      test_build(test,"6. Empujar (el paciente en bipedestación con el tronco erecto y los pies tan juntos como sea posible). El examinador empuja suavemente en el esternón del paciente con la palma de la mano, tres veces (sin prevenirlo). Asegúrese que un evaluador esté detrás de la persona para evitar caída." ,"check", answers: options,  group: 1 )
      #
      # question 7
      options= Array.new
      options << {"contentq"=> "Inestable","point" => 0, "desc" => ""}
      options << {"contentq"=> "Estable","point" => 1, "desc" => ""}
      test_build(test,"Ojos cerrados (en la posición del punto 6)" ,"check", answers: options, group: 1 )
      #
      # question 8
      options= Array.new
      options << {"contentq"=> "Pasos discontinuos","point" => 0, "desc" => ""}
      options << {"contentq"=> "Continuos.","point" => 1, "desc" => ""}
      options << {"contentq"=> "Inestable (se tambalea, se agarra)","point" => 1, "desc" => ""}
      options << {"contentq"=> "Estable","point" => 0, "desc" => ""}
      test_build(test,"Vuelta de 360 grados sobre su propio eje" ,"check", answers: options, group: 1 )
      # 
      # question 9
      options= Array.new
      options << {"contentq"=> "Inseguro, calcula mal la distancia, cae en la silla","point" => 0, "desc" => ""}
      options << {"contentq"=> "Usa los brazos o el movimiento es brusco","point" => 1, "desc" => ""}
      options << {"contentq"=> "Seguro, movimiento suave","point" => 2, "desc" => ""}
      test_build(test,"Sentarse" ,"check", answers: options, group: 1 )
      #
      # question 10
      options= Array.new
      options << {"contentq"=> "Algunas vacilaciones o múltiples intentos para empezar","point" => 0, "desc" => ""}
      options << {"contentq"=> "No vacila","point" => 1, "desc" => ""}
      test_build(test,"Iniciación de la marcha (inmediatamente después de decir que ande)" ,"check", answers: options, group: 2 )
      #
      # question 11
      options= Array.new
      options << {"contentq"=> "No sobrepasa al pie izquierdo con el paso","point" => 0, "desc" => ""}
      options << {"contentq"=> "Sobrepasa al pie izquierdo","point" => 0, "desc" => ""}
      test_build(test,"Longitud y altura de paso a) Movimiento del pie derecho" ,"check", answers: options, group: 2 )
      #
      options= Array.new
      options << {"contentq"=> "El pie derecho, no se separa completamente del suelo con el paso","point" => 0, "desc" => ""}
      options << {"contentq"=> "El pie derecho, se separa completamente del suelo","point" => 1, "desc" => ""}
      test_build(test,"" ,"check", answers: options, group: 2 )
      
      # question 11
      options= Array.new
      options << {"contentq"=> "No sobrepasa al pie derecho, con el paso","point" => 0, "desc" => ""}
      options << {"contentq"=> "Sobrepasa al pie derecho","point" => 1, "desc" => ""}
      test_build(test,"b) Movimiento del pie izquierdo" ,"check", answers: options, group: 2 )
      # 
      options= Array.new
      options << {"contentq"=> "El pie izquierdo, no se separa completamente del suelo con el paso","point" => 0, "desc" => ""}
      options << {"contentq"=> "El pie izquierdo, se separa completamente del suelo","point" => 1, "desc" => ""}
      test_build(test,"b) Movimiento del pie izquierdo" ,"check", answers: options, group: 2 )
      # question 12
      options= Array.new
      options << {"contentq"=> "La longitud de los pasos con los pies izquierdo y derecho, no es igual","point" => 0, "desc" => ""}
      options << {"contentq"=> "La longitud parece igual","point" => 1, "desc" => ""}
      test_build(test,"Simetría del paso" ,"check", answers: options, group: 2 )
      #
      # question 13
      options= Array.new
      options << {"contentq"=> "Paradas entre los pasos","point" => 0, "desc" => ""}
      options << {"contentq"=> "Los pasos parecen continuos","point" => 1, "desc" => ""}
      test_build(test,"Fluidez del paso" ,"check", answers: options,  group: 1 )
      #
      # question 14
      options= Array.new
      options << {"contentq"=> "Desviación grave de la trayectoria","point" => 0, "desc" => ""}
      options << {"contentq"=> "Leve/moderada desviación o usa ayudas para mantener la trayectoria","point" => 1, "desc" => ""}
      options << {"contentq"=> "Sin desviación o ayudas","point" => 2, "desc" => ""}
      test_build(test,"Trayectoria (observar el trazado que realiza uno de los pies durante unos 3 metros)" ,"check", answers: options, group: 2 )
      #
      # question 15
      options= Array.new
      options << {"contentq"=> "Balanceo marcado o usa ayudas","point" => 0, "desc" => ""}
      options << {"contentq"=> "No se balancea pero flexiona las rodillas o la espalda o separa los brazos al caminar","point" => 1, "desc" => ""}
      options << {"contentq"=> "No se balancea, no se flexiona, ni utiliza otras ayudas","point" => 2, "desc" => ""}
      test_build(test,"Tronco" ,"check", answers: options, group: 2 )
      #
      # question 16
      options= Array.new
      options << {"contentq"=> "Talones separados","point" => 0, "desc" => ""}
      options << {"contentq"=> "Talones casi juntos al caminar","point" => 1, "desc" => ""}
      test_build(test,"Postura al caminar" ,"check", answers: options , group: 2)

    end


end
