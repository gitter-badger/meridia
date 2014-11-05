require 'spec_helper'

describe "Activities" do
  describe "GET /activities" do
    it "works! (now write some real  specs)" do
      get activities_path
      response.status.should be(200)
    end
  end
end
