require "spec_helper"

describe EnoncesController do
  describe "routing" do

    it "routes to #index" do
      get("/enonces").should route_to("enonces#index")
    end

    it "routes to #new" do
      get("/enonces/new").should route_to("enonces#new")
    end

    it "routes to #show" do
      get("/enonces/1").should route_to("enonces#show", :id => "1")
    end

    it "routes to #edit" do
      get("/enonces/1/edit").should route_to("enonces#edit", :id => "1")
    end

    it "routes to #create" do
      post("/enonces").should route_to("enonces#create")
    end

    it "routes to #update" do
      put("/enonces/1").should route_to("enonces#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/enonces/1").should route_to("enonces#destroy", :id => "1")
    end

  end
end
