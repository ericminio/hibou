require 'spec_helper'

describe "children/show.html.haml" do
  before(:each) do
    @child = assign(:child, stub_model(Child,
                                       :first_name => "George",
                                       :last_name  => "Orwell",
                                       :birth_date => Date.civil(2007, 03, 23),
                                       :notes      => "Allergic to peanuts"
    ))
  end

  it "renders child file details" do
    render
    rendered.should contain("George Orwell")
    rendered.should contain("23 March 2007")
    rendered.should contain("3 years")
    rendered.should contain("Allergic to peanuts")
  end
end
