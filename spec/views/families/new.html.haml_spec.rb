require 'spec_helper'

describe "families/new.html.haml" do
  before(:each) do
    assign(:family, stub_model(Family,
      :name => "MyString",
      :sin => "MyString"
    ).as_new_record)
  end

  it "renders new family form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => families_path, :method => "post" do
      assert_select "input#family_name", :name => "family[name]"
      assert_select "input#family_sin", :name => "family[sin]"
    end
  end
end
