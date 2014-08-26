require 'rails_helper'

RSpec.describe "AdditionalServices", :type => :request do
  describe "GET /additional_services" do
    it "works! (now write some real specs)" do
      get additional_services_path
      expect(response.status).to be(200)
    end
  end
end
