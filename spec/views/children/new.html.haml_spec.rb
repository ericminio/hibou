require 'spec_helper'

describe "children/new.html.haml" do

    before(:each) do
      assign(:child, stub_model(Child, :first_name => "George", :last_name  => "Orwell").as_new_record)
    end

    it "renders a form to create a child account" do
      render
      rendered.should have_selector("form",
                                    :method => "post",
                                    :action => children_path) do |form|
        form.should have_selector("input", :type =>'text', :name => 'child[first_name]')
        form.should have_selector("input", :type =>'text', :name => 'child[last_name]')
        form.should have_selector("select", :name => 'child[birth_date(1i)]')
        form.should have_selector("select", :name => 'child[birth_date(2i)]')
        form.should have_selector("select", :name => 'child[birth_date(3i)]')
        form.should have_selector("input", :type => 'checkbox', :name => 'child[snack]')
        form.should have_selector("input", :type => 'checkbox', :name => 'child[bottle]')
        form.should have_selector("input", :type => 'checkbox', :name => 'child[nap]')
        form.should have_selector("textarea", :name =>'child[allergies]')
        form.should have_selector("textarea", :name =>'child[public_notes]')
        form.should have_selector("textarea", :name =>'child[private_notes]')
        form.should have_selector("input", :type => "submit")
      end
    end
end