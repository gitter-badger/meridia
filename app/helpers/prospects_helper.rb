module ProspectsHelper
	def status_style(status)
		case status
			when true
				@label = "Realizado"
				"border-left:3px #47a447 solid"
			when false
				@label = "Pendiente"
				"border-left:3px #f0ad4e solid"
		end		
	end
end
