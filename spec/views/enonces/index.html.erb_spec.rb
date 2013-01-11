require 'spec_helper'

describe "enonces/index" do
  before(:each) do
    assign(:enonces, [
      stub_model(Enonce),
      stub_model(Enonce)
    ])
  end

  it "renders a list of enonces" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
