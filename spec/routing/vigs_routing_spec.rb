require "spec_helper"

describe VigsController do
  describe "routing" do

    it "routes to #index" do
      get("/vigs").should route_to("vigs#index")
    end

    it "routes to #new" do
      get("/vigs/new").should route_to("vigs#new")
    end

    it "routes to #show" do
      get("/vigs/1").should route_to("vigs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vigs/1/edit").should route_to("vigs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vigs").should route_to("vigs#create")
    end

    it "routes to #update" do
      put("/vigs/1").should route_to("vigs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vigs/1").should route_to("vigs#destroy", :id => "1")
    end

  end
end
