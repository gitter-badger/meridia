require 'modules/build_test'
class Dummy
  include BuildTest
  def self.test
      test = Test.new(title: "Dummy de la Funcionalidad", calculate: :average, code: 9 )
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
end
