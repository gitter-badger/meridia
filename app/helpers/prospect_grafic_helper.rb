module ProspectGraficHelper
	def grafic(data, type_data, symbol)
		res =[]
		if !data.nil?
			type_data.each do |medio|
				medio_count = []
				medio_count = [medio , data.where(symbol => medio).nil? ? 0 : data.where(symbol => medio).count]
				res << medio_count
			end
		end
		res
			
	end
end

	