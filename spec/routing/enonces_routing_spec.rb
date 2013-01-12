require "spec_helper"

describe EnoncesController do
  describe "routing" do

    it "routes to #show" do
      get("/enonces/1").should route_to("enonces#show", :id => "1", "format"=>"json")
    end

    it "routes to #create" do
      post("/enonce/1").should route_to("enonces#create", :id => '1')
    end

  end
end
