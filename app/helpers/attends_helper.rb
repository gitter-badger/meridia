module AttendsHelper
	def member_exist (attends, member)
		count = 0
		attends.each do |attend|
			if attend.member == member
				count += 1
			end
		end
		count > 0 ? false : true
	end
end
