require 'spec_helper'

describe Attend do
	it "user enters" do
		user = FactoryGirl.create(:member)
		attend = Attened.new()
		attend.members << user	
		attend.save
	end
	
	it "attend outs" do
	end
	
	it "clouse day" do 

	end
end
