require "spec_helper"

describe JajascriptController do
  describe "routing" do

    it "routes to optimize" do
      post("/jajascript/optimize").should route_to("jajascript#optimize")
    end

  end
end
