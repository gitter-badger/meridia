require 'rails_helper'

RSpec.describe "Messengers", :type => :request do
  describe "GET /messengers" do
    it "works! (now write some real specs)" do
      get messengers_path
      expect(response.status).to be(200)
    end
  end
end
