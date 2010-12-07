require 'spec_helper'

describe "families/index.html.haml" do
  before(:each) do
    assign(:families, [
      stub_model(Family,
        :name => "Name",
        :sin => "Sin"
      ),
      stub_model(Family,
        :name => "Name",
        :sin => "Sin"
      )
    ])
  end

  it "renders a list of families" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sin".to_s, :count => 2
  end
end
