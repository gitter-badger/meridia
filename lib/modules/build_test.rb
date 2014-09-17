module  BuildTest
    
 def self.included(base)
      base.extend(ClassMethods)
 end 

  module ClassMethods
  def test_build(test, q_content, type, options = false) 
      questions_= {
        "content" => q_content,
        "type" => type
			}

			# if option exist check if the key group exits
			if options && options.has_key?(:group)
							questions_ = questions_.merge(group: options[:group])
			end
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
      elsif type == 'nested' && !options[:answers].nil?
        # Save the question
        questions_["questions_attributes" ] = {}
        questions_["options_answers_attributes"] = {}

        options[:answers].each_with_index do |option, i| 
          #puts 'ANSWER'

          questions_["options_answers_attributes"][i] = {content:option["contentq"], points: option["point"], description:option["desc"]}
          if option["questions"].nil?
            
            #save only the option
            questions_["options_answers_attributes"][i] = questions_["options_answers_attributes"][i].merge({isnested:false})

          else
            questions_["options_answers_attributes"][i] = questions_["options_answers_attributes"][i].merge({isnested:true})
            
            #save nested questions
            option["questions"].each_with_index do |q, j|
              questions_["questions_attributes"][j] = q.except( :answers, :questions )
              case q[:type]
              when 'section'
                questions_["questions_attributes"][j]["questions_attributes"] = {}
                q[:questions].each_with_index do |nq, k|
                  questions_["questions_attributes"][j]["questions_attributes"][k] = nq
                end
              else 
                questions_["questions_attributes"][j]["options_answers_attributes"] = {}
                q[:answers].each_with_index do |a, l|
                  questions_["questions_attributes"][j]["options_answers_attributes"][l] = {content:a["contentq"], points: a["point"], description:""}
                end
              end
            end

          end
        end
      end

      #puts questions_
      test.questions <<  Question.create(questions_)

    end
  end 
end
