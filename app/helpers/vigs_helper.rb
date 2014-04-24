module VigsHelper
	def status (test, vig)
		res =  VigsTest.where(test_id: test.id, vig_id: vig.id)
		value = res[0].nil? ? false : res[0].status
		if value
			link_to test.title, test_answers_path(test)
		else
			link_to test.title, vig_test_path(@vig,test)
		end
	end
end
