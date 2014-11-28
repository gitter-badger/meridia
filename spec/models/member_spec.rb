require 'spec_helper'

describe Member do
  before(:each) do
    @attr={
     name: "test name",
     lastname: "last",
     gender: "1",
     phone: "44444",
     families_attributes:[
       firstname: "TestFamily",
       lastname: "last" ,
       phone_home: "phone"
     ]
    }
  end
  context "params with blank nested attributes" do
    it "should save member" do
      member = Member.new(@attr)
      member.should be_valid
    end
    it "don't save families"do
      member_without_families = Member.create(@attr.merge(families_attributes:[]));
      expect(member_without_families.families).to be_empty
    end
    
    it "don't save health_insurances" do
    end
    
    it "don't save health_services" do

    end
    it "don't save signs" do

    end
    it "don't save allergies" do
      member_without_allergies = Member.create(@attr);
      expect(member_without_allergies.allergies).to be_empty

    end
    it "don't save medicines" do
      member_without_medicines = Member.create(@attr);
      expect(member_without_medicines.medicines).to be_empty

    end

    it "don't save breaths" do

    end

    it "don't save bloods" do

    end

    it "don't save others" do

    end

    it "don't save nutritions" do

    end
    it "don't save bodies" do

    end
    it "dont save depositions" do

    end

    it "don't save mobilizations" do

    end
    
  end
end
