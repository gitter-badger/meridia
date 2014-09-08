module VigsHelper
	def status (test, vig)
		@res =  VigsTest.where(test_id: test.id, vig_id: vig.id)
		
		value = @res[0].nil? ? false : @res[0].status
	end

	def calculate(test)
		send(test.test.calculate, test.points)
	end

	def hamilton(points)
		total = points['total']+ points['total2']
		html = Hash.new
    html[:points] = total
    html[:somatica]="Somatica: #{ points['total2']}"
    html[:psiquica]="Psiquica: #{points['total']}"
		case total.to_i
			when 0..5
				html[:scale]="Ausencia"
			when 6..14
				html[:scale]="Leve"
			when proc {|total| total > 15 }
				html[:scale]="Moderada/Grave"
			else
				html[:scale]="No Disponible"
		    html[:points] = ""
        html[:somatica]=""
        html[:psiquica]=""
    end
		html
	end

	def barthel(points)
		html = Hash.new
    html[:points] = points['total']
    case points['total']
				when 0..44
					html[:scale]="Alta"
				when 45..59
					html[:scale]="Mayor"
				when 60..79
					html[:scale]="Puntos Moderada"
				when 80..100
					html[:scale]="Ligera"
				else
					html[:scale]="No disponible"
          html[:points] = ""
		end
    html
	end

	def mental(points)
		total = points['total']
		html = Hash.new
    html[:points] = total
    case total
		when total >= 25
			html[:scale]=	"Normal"
		when 24..26
			html[:scale]=	"Deterioro C"		
		when 21..23
					html[:scale]=	"Leve"
		when 11..20
						html[:scale]= "D. Moderada"
		when 0..10
				html[:scale]=		"D. Alta"
		else
		  html[:scale]="No disponible"
      html[:points] = ""
    end
    html
	end

	def lawton(points)
		html = Hash.new
    html[:points] = points['total']
    case points['total']
		when 4..7
			html[:scale]="Moderada"
		when 0..4
		  html[:scale]="Mayor"
    else
		  html[:points] = ""
      html[:scale]="No disponible"
    end
    html
	end
	def tinetti(points)
		total = points['total']+ points['total2']
		html= {}
    html[:points] = total
    html[:marcha]  = "Marcha:#{ points['total2']}"
    html[:eq]="Eq:#{points['total']}"
		case total.to_i
			when 25..28
				html[:scale]= "R. Bajo"
			when 19..24
				html [:scale]="R. moderada"
			when proc {|total| total < 18 && total>0 }
				html [:scale]= "R.Alto"
			else
				html[:scale] = "No Disponible"
		    html[:points] = ""
    end
		html
		
	end
	def yesavage(points)
		html= {}
    html[:points] =points['total']
    case points['total']
		when 0..5
					html[:scale]=	"Normal"
		when 6..9
					html[:scale]=	"Leve"
		when points['total'] > 10 
						html[:scale]= "D.establecida"
		else
					html[:scale]=	"No disponible"
		      html[:points] = ""
    end
    html
	end

	def arr_cognitiva members
		normal = 0
		cognitivo= 0
		leve = 0
		moderada = 0
		severa = 0
		none = 0
		falta = 0
		members.each do |member|
			if member.vigs && !member.vigs.last.nil?
				total = member.vigs.last.folstein['total']
				case total
				when total >= 25
					normal += 1
				when 24..26
					cognitivo += 1
				when 21..23
					leve += 1
				when 11..20
					moderada += 1
				when 0..10
					severa += 1
				else
					none += 1
				end
			else
				falta += 1
			end
		end
		arr_cognitia = []
		arr_cognitia << ['Normal', normal]
		arr_cognitia << ['Deterioro Cognitivo', cognitivo]
		arr_cognitia << ['Deterioro Leve', leve]
		arr_cognitia << ['Demecia Moderada', moderada]
		arr_cognitia << ['Demencia Alta', severa]
		arr_cognitia << ['No llenado', none]
		arr_cognitia << ['Falta examen', falta]
		arr_cognitia 
	end

	def arr_dependencia members
		falta = 0
		none = 0
		severa = 0
		grave = 0
		moderada= 0
		ligera = 0
		members.each do |member|
			if member.vigs && !member.vigs.last.nil?
				total = member.vigs.last.abvd['total']
				puts "****"*50, total
				case total
				when 0..44
					severa += 1
				when 45..59
					grave += 1
				when 60..79
					moderada += 1
				when 80..100
					ligera +=1
				else
					none += 1
				end
			else
				falta += 1
			end				
		end
		arr_dependencia = []
		arr_dependencia << ['Alta', severa]
		arr_dependencia << ['Mayor', grave]
		arr_dependencia << ['Moderada', moderada]
		arr_dependencia << ['Ligera', ligera]
		arr_dependencia << ['No llenado', none]
		arr_dependencia << ['Falta examen', falta]
		arr_dependencia 
	end
  def oars points
    "Deprecion : #{points['total']} Puntos"
  end
end
