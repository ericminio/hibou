require 'spec_helper'

describe "children/new.html.haml" do
  before(:each) do
    assign(:child, stub_model(Child,
      :first_name => "MyString",
      :last_name => "MyString"
    ).as_new_record)
  end

  it "renders new child form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => children_path, :method => "post" do
      assert_select "input#child_first_name", :name => "child[first_name]"
      assert_select "input#child_last_name", :name => "child[last_name]"
    end
  end
end
