require 'spec_helper'

describe "children/show.html.haml" do
  before(:each) do
    @child = assign(:child, stub_model(Child,
                                       :first_name => "George",
                                       :last_name  => "Orwell",
                                       :notes      => "Allergic to peanuts"
    ))
  end

  it "renders child file details" do
    render
    rendered.should contain("George")
    rendered.should contain("Orwell")
    rendered.should contain("Allergic to peanuts")
  end
end
