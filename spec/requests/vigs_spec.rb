require 'spec_helper'

describe "Vigs" do
  
  describe "Nursing Test" do
    before(:all)  do
      login
      @member = FactoryGirl.create(:member)
    end
    
    it "visit step_one" do
      get new_member_nursing_path(:member_id => @member.id)
      response.status.should be(200)
    end
    
    it "visit step_two"do
      get step_two_member_nursing_index_path(@member.id)
      response.status.should be(200)
    end

    it "visit step_three" do
      get step_three_member_nursing_index_path(@member.id)
      response.status.should be(200)
    end

    it "visit step_four" do
      get step_four_member_nursing_index_path(@member.id)
      response.status.should be(200)
    end

    it "visit step_five" do 
      get step_five_member_nursing_index_path(@member.id)
      response.status.should be(200)
    end

  end
end
