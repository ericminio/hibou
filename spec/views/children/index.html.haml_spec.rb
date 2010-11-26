require 'spec_helper'

describe "children/index.html.haml" do
  before(:each) do
    assign(:children, [
      stub_model(Child,
        :first_name => "First Name",
        :last_name => "Last Name"
      ),
      stub_model(Child,
        :first_name => "First Name",
        :last_name => "Last Name"
      )
    ])
  end

  it "renders a list of children" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
  end
end
