require 'spec_helper'

describe "Enonces" do
  describe "GET /enonces" do

    it "show enonce" do
    	enonce = Enonce.create
      get enonce_path enonce
      response.status.should be(200)
    end
  end
end
