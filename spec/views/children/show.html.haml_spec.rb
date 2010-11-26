require 'spec_helper'

describe "children/show.html.haml" do
  before(:each) do
    @child = assign(:child, stub_model(Child,
      :first_name => "First Name",
      :last_name => "Last Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Last Name/)
  end
end
