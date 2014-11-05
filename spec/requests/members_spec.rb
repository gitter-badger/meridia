require 'spec_helper'

describe "Members" do
  describe "GET /members" do
    before :each do
      @member1 = FactoryGirl.build(:member, name: "alba")
      @member2 = FactoryGirl.build(:member, name: "jhon")
      @member3 = FactoryGirl.create(:member, name: "zent")
    end
  
    it "visit members" do
      visit members_path
      page.status_code.should == 200
    end
    
    it "sorteable links default" do
     visit members_path
     within('#name') do
      click_on "nombre"
     end
     page.should have_content("Participantes") 
    end

  end
end
