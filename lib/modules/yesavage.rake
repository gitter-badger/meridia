require 'modules/build_test'
class Yesavage
  include BuildTest
  def self.test
    test = Test.new(title: "ESCALA DE YESAVAGE (Versión reducida)", calculate: :yesavage, test_code:7)
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
end
