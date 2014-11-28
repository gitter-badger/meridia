require 'rails_helper'

RSpec.describe "Mailboxes", :type => :request do
  describe "GET /mailboxes" do
    it "works! (now write some real specs)" do
      get mailboxes_path
      expect(response.status).to be(200)
    end
  end
end
