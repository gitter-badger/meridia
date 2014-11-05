require 'modules/build_test'
class Mna
  include BuildTest

    def self.test_short
      test= Test.new(title: "Mini Nutritional assessment MNA (Cribaje)", calculate: :mna , code: 9, description: " Responda al cuestionario eligiendo la opción adecuada para cada pregunta. Sume los puntos para el resultado final.",kindof: :medical)
      test.save!

      questions = Array.new
      options= Array.new
      options << {"contentq"=> " ha comido mucho menos ","point" => 0}
      options << {"contentq"=> " ha comido menos ","point" => 1}
      options << {"contentq"=> "  ha comido igual ","point" => 2}
      questions<<{content:"Ha comido menos por falta de apetito, problemas digestivos, dificultades de masticación o deglución en los últimos 3 meses? " ,type:"check", answers: options }

      options= Array.new
      options << {"contentq"=> "Pérdida de peso >3 kg ","point" => 0}
      options << {"contentq"=> "No lo sabe ","point" => 1}
      options << {"contentq"=> "Pérdida de peso entre 1 y 3 kg ","point" => 2 }
      options << {"contentq"=> "No ha habido pérdida de peso ","point" => 3}
      
      questions<<{content:"Pérdida reciente de peso (<3 meses) " ,type: "check", answers: options }
    
      options= Array.new
      options << {"contentq"=> "de la cama al sillón ","point" => 0}
      options << {"contentq"=> "autonomía en el interior ","point" => 1}
      options << {"contentq"=> " sale del domicilio","point" => 2}

      questions<<{content:"Movilidad" ,type: "check", answers: options }

      options= Array.new
      options << {"contentq"=> "Si ","point" => 0}
      options << {"contentq"=> "No","point" => 2}
      questions<<{content: "Ha tenido una enfermedad aguda o situación de estrés psicológico en los últimos 3 meses?" ,type:"check", answers: options }

      options= Array.new
      options << {"contentq"=> "demencia o depresión grave  ","point" => 0}
      options << {"contentq"=> "demencia moderada ","point" => 1}
      options << {"contentq"=> "sin problemas psicológicos ","point" => 2}
      questions << {content: "Problemas neuropsicológicos " ,type: "check", answers: options }

      
      options= Array.new
      options << {"contentq"=> " IMC <19   ","point" => 0}
      options << {"contentq"=> " 19 ≤ IMC < 21 ","point" => 1}
      options << {"contentq"=> " 21 ≤ IMC < 23  ","point" => 2}
      options << {"contentq"=> " IMC ≥ 23 ","point" => 3}

      questions << {content: " Índice de masa corporal (IMC = peso / (talla)² en kg/m²) " ,type: "check", answers: options }
      test_build( test, "Cribaje", "section", questions: questions )



    end

    def self.test_ext
      test= Test.new(title: "Mini Nutritional assessment MNA Completo", calculate: :mna_ext , code: 10, description: " Responda al cuestionario eligiendo la opción adecuada para cada pregunta. Sume los puntos para el resultado final.",kindof: :medical)
      test.save!

      questions = Array.new
      options= Array.new
      options << {"contentq"=> " ha comido mucho menos ","point" => 0}
      options << {"contentq"=> " ha comido menos ","point" => 1}
      options << {"contentq"=> "  ha comido igual ","point" => 2}
      questions<<{content:"Ha comido menos por falta de apetito, problemas digestivos, dificultades de masticación o deglución en los últimos 3 meses? " ,type:"check", answers: options }

      options= Array.new
      options << {"contentq"=> "Pérdida de peso >3 kg ","point" => 0}
      options << {"contentq"=> "No lo sabe ","point" => 1}
      options << {"contentq"=> "Pérdida de peso entre 1 y 3 kg ","point" => 2 }
      options << {"contentq"=> "No ha habido pérdida de peso ","point" => 3}
      
      questions<<{content:"Pérdida reciente de peso (<3 meses) " ,type: "check", answers: options }
    
      options= Array.new
      options << {"contentq"=> "de la cama al sillón ","point" => 0}
      options << {"contentq"=> "autonomía en el interior ","point" => 1}
      options << {"contentq"=> " sale del domicilio","point" => 2}

      questions<<{content:"Movilidad" ,type: "check", answers: options }

      options= Array.new
      options << {"contentq"=> "Si ","point" => 0}
      options << {"contentq"=> "No","point" => 2}
      questions<<{content: "Ha tenido una enfermedad aguda o situación de estrés psicológico en los últimos 3 meses?" ,type:"check", answers: options }

      options= Array.new
      options << {"contentq"=> "demencia o depresión grave  ","point" => 0}
      options << {"contentq"=> "demencia moderada ","point" => 1}
      options << {"contentq"=> "sin problemas psicológicos ","point" => 2}
      questions << {content: "Problemas neuropsicológicos " ,type: "check", answers: options }

      
      options= Array.new
      options << {"contentq"=> " IMC <19   ","point" => 0}
      options << {"contentq"=> " 19 ≤ IMC < 21 ","point" => 1}
      options << {"contentq"=> " 21 ≤ IMC < 23  ","point" => 2}
      options << {"contentq"=> " IMC ≥ 23 ","point" => 3}

      questions << {content: " Índice de masa corporal (IMC = peso / (talla)² en kg/m²) " ,type: "check", answers: options }
      test_build( test, "Cribaje", "section", questions: questions )

      questions = Array.new
      options= Array.new 

      options << {"contentq"=> "si","point" => 1}
      options << {"contentq"=> "no","point" => 0}
      questions << {content: "¿el paciente vive independiente en su domicilio ?" ,type: "check", answers: options }

      options= Array.new
      options << {"contentq"=> "si","point" => 0}
      options << {"contentq"=> "no","point" => 1}
      questions << {content: "¿Toma mas de 3 medicamentos al dia?" ,type: "check", answers: options }

      options= Array.new
      options << {"contentq"=> "si","point" => 0}
      options << {"contentq"=> "no","point" => 1}
      questions << {content: "¿Ulceras o lesiones cutetáneas?" ,type: "check", answers: options }

      options= Array.new
      options << {"contentq"=> "1 comida","point" => 0}
      options << {"contentq"=> "2 comidas","point" => 1}
      options << {"contentq"=> "3 comidas","point" => 2}
      questions << {content: "¿Cuantas comidas completas toma al día?" ,type: "check", answers: options }
      

      options= Array.new
      
      options << {"contentq"=> "0 o 1 síes","point" => 0}
      options << {"contentq"=> "2 síes","point" => 0.5}
      options << {"contentq"=> "3 síes","point" => 1.0} 
      questions << {content: "<strong>Consume el paciente</strong> Productos lácteos almenos una vez al día  SI/NO <br> Huevos o legumbres 1 0 2 veces al día SI/NO <br> Carne, pescado o aves, diariamente  SI/NO" ,type: "check", answers: options }
      
      
      
      options= Array.new
      options << {"contentq"=> "si","point" => 0}
      options << {"contentq"=> "no","point" => 1}
      questions << {content: "¿Consume frutas y verduras al menos 2 veces al día?" ,type: "check", answers: options }
      
      
      options= Array.new
      options << {"contentq"=> "menos de 3 vasos al día","point" => 0}
      options << {"contentq"=> "de 3 a 5  vasos al día","point" => 0.5}
      options << {"contentq"=> "más de 5  vasos al día","point" => 1}
      questions << {content: "¿Cuantos vasos de agua u otros líquidos toma al día?" ,type: "check", answers: options }
      
      options= Array.new
      options << {"contentq"=> "Necesita ayuda","point" => 0}
      options << {"contentq"=> "Se alimenta solo con dificultad","point" => 1}
      options << {"contentq"=> "Se alimenta solo sin dificultad","point" => 2}

      questions << {content: "¿Forma de alimentarse?" ,type: "check", answers: options }

      options= Array.new
      options << {"contentq"=> "malnutrición grave","point" => 0}
      options << {"contentq"=> "no lo sabe o malnutrición moderada","point" => 1}
      options << {"contentq"=> "sin problemas de nitrición","point" => 2}

      questions << {content: "¿se considera el pacíente que esta bien nutrido?" ,type: "check", answers: options }

      options= Array.new
      options << {"contentq"=> "peor","point" => 0}
      options << {"contentq"=> "no lo sabe","point" => 0.5}
      options << {"contentq"=> "igual","point" => 1}
      options << {"contentq"=> "mejor","point" => 2}
      questions << {content: "En comparación con las personas de su edad, como" ,type: "check", answers: options }

      options= Array.new
      options << {"contentq"=> "CB < 21","point" => 0}
      options << {"contentq"=> "21 ≤ CB ≤ 22","point" => 0.5}
      options << {"contentq"=> " CB  ≥ 22","point" => 1}
      questions << {content: "Circunferencia braquial (CB en cm)" ,type: "check", answers: options }

      options= Array.new
      options << {"contentq"=> "CP < 31","point" => 0}
      options << {"contentq"=> "CP ≥ 31","point" => 1}
      questions << {content: "Cicunferencia de la pantorrilla (CP en cm)" ,type: "check", answers: options }

      test_build( test, "Evaluación", "section", questions: questions )

    end


end
