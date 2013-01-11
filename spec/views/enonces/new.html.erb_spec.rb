require 'spec_helper'

describe "enonces/new" do
  before(:each) do
    assign(:enonce, stub_model(Enonce).as_new_record)
  end

  it "renders new enonce form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => enonces_path, :method => "post" do
    end
  end
end
