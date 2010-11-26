require 'spec_helper'

describe "children/edit.html.haml" do
  before(:each) do
    @child = assign(:child, stub_model(Child,
      :new_record? => false,
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders the edit child form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => child_path(@child), :method => "post" do
      assert_select "input#child_first_name", :name => "child[first_name]"
      assert_select "input#child_last_name", :name => "child[last_name]"
    end
  end
end
