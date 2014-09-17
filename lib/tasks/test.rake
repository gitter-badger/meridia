require 'modules/barthel'
require 'modules/lawton'
require 'modules/mna'
require 'modules/oars'
require 'modules/mmse'
require 'modules/tinetti'
require 'modules/hamilton'
require 'modules/dummy'
require 'modules/zarit'

namespace :test do
  desc "test"

  task :setup_test=> :environment do
    Barthel.test
    Oars.test
    Lawton.test
    Mna.test_short
    Mna.test_ext
    Mmse.test
    Tinetti.test
    Hamilton.test
    Zarit.test
    #Dummy.test 
  end

  task :clear=> :enviroment do
    tests = Test.all
    tests.detroy_all
  end

end
  
  
  
  
  #    def nursing
#      test = Test.new(title: "VALORACION INICIAL DE ENFERMERIA", kindof: :nursing,code: 8 );
 #     test.save!
#
 #     questions = Array.new
#
 #     options= Array.new
  #    options << {"contentq"=> "Medicina", "desc" => "" }
   #   options << {"contentq"=> "Alimento", "desc" => "" }
    #  questions << { content: 'Tipo', type: 'check', answers: options }
#
#      questions << { content: "Nombre", type: "text" }
#      #ModuleTest.test_build(test, "Alergias (Medicamentos/Alimentos)" ,"section", questions: questions, multiple: true )
#    end
#
#end
