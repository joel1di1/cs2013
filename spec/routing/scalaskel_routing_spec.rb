require "spec_helper"

describe ScalaskelController do
  describe "routing" do

    it "routes to #change" do
      get("/scalaskel/change/1").should route_to("scalaskel#change", :amount => "1")
    end

  end
end
