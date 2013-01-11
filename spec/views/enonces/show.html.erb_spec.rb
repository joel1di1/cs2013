require 'spec_helper'

describe "enonces/show" do
  before(:each) do
    @enonce = assign(:enonce, stub_model(Enonce))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
