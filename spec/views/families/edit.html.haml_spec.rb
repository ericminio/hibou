require 'spec_helper'

describe "families/edit.html.haml" do
  before(:each) do
    @family = assign(:family, stub_model(Family,
      :name => "MyString",
      :sin => "MyString"
    ))
  end

  it "renders the edit family form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => family_path(@family), :method => "post" do
      assert_select "input#family_name", :name => "family[name]"
      assert_select "input#family_sin", :name => "family[sin]"
    end
  end
end
