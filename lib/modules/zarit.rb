require 'modules/build_test'
class Zarit
  include BuildTest 
  def self.test
      test = Test.new(title: "TEST DE ZARIT", calculate: :zarit, code: 11, kindof: :psicologico )
      test.save!

  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test," ¿Siente que su familiar solicita más ayuda de la que realmente necesita?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Siente que debido al tiempo que dedica a su familiar ya no dispone de tiempo suficiente para usted?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test," ¿Se siente tenso cuando tiene que cuidar a su familiar y atender además otras responsabilidades?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Se siente avergonzado por la conducta de su familiar?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test," ¿Se siente enfadado cuando está cerca de su familiar?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Cree que la situación actual afecta de manera negativa a su relación con amigos y otros miembros de su familia?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Siente temor por el futuro que le espera a su familiar?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Siente que su familiar depende de usted?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Se siente agobiado cuando tiene que estar junto a su familiar?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Siente que su salud se ha resentido por cuidar a su familiar?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Siente que no tiene la vida privada que desearía debido a su familiar?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Cree que su vida social se ha visto afectada por tener que cuidar de su familiar?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Se siente incómodo para invitar amigos a casa, a causa de su familiar?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Cree que su familiar espera que usted le cuide, como si fuera la única persona con la que puede contar?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Cree que no dispone de dinero suficiente para cuidar a su familiar además de sus otros gastos?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Siente que será incapaz de cuidar a su familiar por mucho más tiempo?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Siente que ha perdido el control sobre su vida desde que la enfermedad de su familiar se manifestó?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Desearía poder encargar el cuidado de su familiar a otras personas?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Se siente inseguro acerca de lo que debe hacer con su familiar?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Siente que debería hacer más de lo que hace por su familiar?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"¿Cree que podría cuidar de su familiar mejor de lo que lo hace?" ,"check", answers: options )  
  options= Array.new
  options << {"contentq"=> "Nunca","point" => 0, "desc" => ""}
  options << {"contentq"=> "Rara vez","point" => 1, "desc" => ""}
  options << {"contentq"=> "Algunas veces","point" => 2, "desc" => ""}
  options << {"contentq"=> "Bastantes veces","point" => 3, "desc" => ""}
  options << {"contentq"=> "Casi siempre","point" => 4, "desc" => ""}

  test_build(test,"En general: ¿Se siente muy sobrecargado por tener que cuidar de su familiar?" ,"check", answers: options )  

    
  end
end
