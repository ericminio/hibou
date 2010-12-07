require 'spec_helper'

describe "families/show.html.haml" do
  before(:each) do
    @family = assign(:family, stub_model(Family,
      :name => "Name",
      :sin => "Sin"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Sin/)
  end
end
