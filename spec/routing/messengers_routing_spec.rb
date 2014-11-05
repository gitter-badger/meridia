require "rails_helper"

RSpec.describe MessengersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/messengers").to route_to("messengers#index")
    end

    it "routes to #new" do
      expect(:get => "/messengers/new").to route_to("messengers#new")
    end

    it "routes to #show" do
      expect(:get => "/messengers/1").to route_to("messengers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/messengers/1/edit").to route_to("messengers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/messengers").to route_to("messengers#create")
    end

    it "routes to #update" do
      expect(:put => "/messengers/1").to route_to("messengers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/messengers/1").to route_to("messengers#destroy", :id => "1")
    end

  end
end
