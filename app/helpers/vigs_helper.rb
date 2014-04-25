module VigsHelper
	def status (test, vig)
		@res =  VigsTest.where(test_id: test.id, vig_id: vig.id)
		
		value = @res[0].nil? ? false : @res[0].status
	end
end
