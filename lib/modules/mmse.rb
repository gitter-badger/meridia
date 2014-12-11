require 'modules/build_test'
class Mmse
  include BuildTest
  def self.test
    test = Test.new(title: "MINI-MENTAL STATE EXAMINATION (MMSE)", calculate: :mmse,test_code: 6)
    test.save!

    #
    questions = Array.new

    options= Array.new
    options << {"contentq"=> "1","point" => 1, "desc" => ""}
    options << {"contentq"=> "2","point" => 2, "desc" => ""}
    options << {"contentq"=> "3","point" => 3, "desc" => ""}
    options << {"contentq"=> "4","point" => 4, "desc" => ""}
    options << {"contentq"=> "5","point" => 5, "desc" => ""}
    questions << { content: 'Lugar y fecha de nacimiento. Edad:', type: 'check', answers: options }

    options= Array.new
    options << {"contentq"=> "1","point" => 1, "desc" => ""}
    options << {"contentq"=> "2","point" => 2, "desc" => ""}
    options << {"contentq"=> "3","point" => 3, "desc" => ""}
    options << {"contentq"=> "4","point" => 4, "desc" => ""}
    options << {"contentq"=> "5","point" => 5, "desc" => ""}
    questions << { content: '¿Dónde está Ud. ahora? (domicilio, lugar, hospital, ciudad, país)', type: 'check', answers: options }

    test_build( test, "Orientación", "section", questions: questions )

    #
    questions = Array.new

    options= Array.new
    options << {"contentq"=> "1","point" => 1, "desc" => ""}
    options << {"contentq"=> "2","point" => 2, "desc" => ""}
    options << {"contentq"=> "3","point" => 3, "desc" => ""}
    questions << { content: 'Nombrar tres objetos lentamente. Ej. Casa, zapato, papel.', type: 'check', answers: options }

    test_build( test, "Registro.", "section", questions: questions )

    #
    questions = Array.new

    options= Array.new
    options << {"contentq"=> "1","point" => 1, "desc" => ""}
    options << {"contentq"=> "2","point" => 2, "desc" => ""}
    options << {"contentq"=> "3","point" => 3, "desc" => ""}
    options << {"contentq"=> "4","point" => 4, "desc" => ""}
    options << {"contentq"=> "5","point" => 5, "desc" => ""}
    questions << { content: 'Múltiplos de atrás hacia adelante.(93, 86, 79, 72, 85) - Deletrear de atrás hacia delante la palabra MUNDO.', type: 'check', answers: options }

    test_build( test, "Atención y cálculo.", "section", questions: questions )

    #
    questions = Array.new

    options= Array.new
    options << {"contentq"=> "1","point" => 1, "desc" => ""}
    options << {"contentq"=> "2","point" => 2, "desc" => ""}
    options << {"contentq"=> "3","point" => 3, "desc" => ""}
    questions << { content: 'Repetir los objetos nombrados anteriormente (casa, zapato, papel)', type: 'check', answers: options }

    test_build( test, "Memoria", "section", questions: questions )

    #
    questions = Array.new

    options= Array.new
    options << {"contentq"=> "1","point" => 1, "desc" => ""}
    options << {"contentq"=> "2","point" => 2, "desc" => ""}
    questions << { content: 'Mostrar un lápiz y un reloj, preguntar sus respectivos nombres.', type: 'check', answers: options }

    options= Array.new
    options << {"contentq"=> "1","point" => 1, "desc" => ""}
    questions << { content: 'Repetir: tres perros en un trigal.', type: 'check', answers: options }

    options= Array.new
    options << {"contentq"=> "1","point" => 1, "desc" => ""}
    options << {"contentq"=> "2","point" => 2, "desc" => ""}
    options << {"contentq"=> "3","point" => 3, "desc" => ""}
    questions << { content: 'Indicar: Tome el papel con su mano derecha, dóblelo a la mitad y póngalo en el suelo.', type: 'check', answers: options }

    options= Array.new
    options << {"contentq"=> "1","point" => 1, "desc" => ""}
    questions << { content: 'Lea  y realice lo  siguiente: -CIERRE LOS OJOS-', type: 'check', answers: options }

    options= Array.new
    options << {"contentq"=> "1","point" => 1, "desc" => ""}
    questions << { content: 'Escriba una oración, enunciado o frece.', type: 'check', answers: options }

    options= Array.new
    options << {"contentq"=> "1","point" => 1, "desc" => ""}
    questions << { content: 'Copie este dibujo.', type: 'check', answers: options }

    test_build( test, "Lenguaje", "section", questions: questions )

  end


end
