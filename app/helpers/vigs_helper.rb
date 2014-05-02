module VigsHelper
	def status (test, vig)
		@res =  VigsTest.where(test_id: test.id, vig_id: vig.id)
		
		value = @res[0].nil? ? false : @res[0].status
	end

	def calculate(test)
		send(test.test.calculate, test.points)
	end

	def hamilton(points)
		total = points['total1']+ points['total2']
		html  = "Asiedad Somatica:#{ points['total2']} <br>
		Ansiedad Psiquica: #{points['total1']}
		<br>"
		case total.to_i
			when 0..5
				html += "Total : #{total} (Ausencia de Ansiedad)"
			when 6..14
				html +="Total :  #{total} (Ansiedad leve)"
			when proc {|total| total > 15 }
				html += "Total : #{total} (Ansiedad Moderada/Grave)"
			else
				"error"
		end
		html
	end
	def barthel(total)
		 case total
				when 0..44
					"Severa"
				when 45..59
					"Grave"
				when 60..79
					"#{total} Puntos (Dependencia Moderada)"
				when 80..100
					"Ligera"
		end
	end
end
