require "rails_helper"

RSpec.describe AdditionalServicesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/additional_services").to route_to("additional_services#index")
    end

    it "routes to #new" do
      expect(:get => "/additional_services/new").to route_to("additional_services#new")
    end

    it "routes to #show" do
      expect(:get => "/additional_services/1").to route_to("additional_services#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/additional_services/1/edit").to route_to("additional_services#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/additional_services").to route_to("additional_services#create")
    end

    it "routes to #update" do
      expect(:put => "/additional_services/1").to route_to("additional_services#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/additional_services/1").to route_to("additional_services#destroy", :id => "1")
    end

  end
end
