require 'spec_helper'

describe "enonces/edit" do
  before(:each) do
    @enonce = assign(:enonce, stub_model(Enonce))
  end

  it "renders the edit enonce form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => enonces_path(@enonce), :method => "post" do
    end
  end
end
