require 'spec_helper'

describe "children/show.html.haml" do
  before(:each) do
    @child = assign(:child, stub_model(Child,
                                       :first_name => "George",
                                       :last_name  => "Orwell",
                                       :birth_date => Date.civil(2007, 03, 23),
                                       :bottle => true,
                                       :snack => false,
                                       :nap => true,
                                       :allergies => "eggs",
                                       :public_notes => "Hides behind fridges",
                                       :private_notes => "Father cannot approach"
    ))
  end

  it "renders child file details" do
    render
    rendered.should contain("George Orwell")
    rendered.should contain("23 March 2007")
    rendered.should contain("3 years")
    rendered.should have_selector('#child-snack-no') do |scope|
      scope.should contain('X')
    end
    rendered.should have_selector('#child-snack-yes') do |scope|
      scope.should_not contain('X')
    end
    rendered.should have_selector('#child-bottle-yes') do |scope|
      scope.should contain('X')
    end
    rendered.should have_selector('#child-bottle-no') do |scope|
      scope.should_not contain('X')
    end
    rendered.should have_selector('#child-nap-yes') do |scope|
      scope.should contain('X')
    end
    rendered.should have_selector('#child-nap-no') do |scope|
      scope.should_not contain('X')
    end
    rendered.should have_selector('#child-allergies-yes') do |scope|
      scope.should contain('X')
    end
    rendered.should have_selector('#child-allergies-no') do |scope|
      scope.should_not contain('X')
    end
    rendered.should contain("eggs")
    rendered.should contain("Hides behind fridges")
    rendered.should contain("Father cannot approach")
  end
end
