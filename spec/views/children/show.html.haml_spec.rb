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

    rendered.should have_selector('#first_name') { |scope| scope.should contain("George") }
    rendered.should have_selector('#last_name') { |scope| scope.should contain("Orwell") }
    rendered.should have_selector('#birth_date') do |scope|
      scope.should contain(I18n.l @child.birth_date, :format => :medium)
      scope.should contain(distance_of_time_in_words(@child.birth_date, Date.today))
    end
    rendered.should have_selector('#snack') { |scope| scope.should contain(t(:no)) }
    rendered.should have_selector('#bottle') { |scope| scope.should contain(t(:yes)) }
    rendered.should have_selector('#nap') { |scope| scope.should contain(t(:yes)) }
    rendered.should have_selector('#allergies') { |scope| scope.should contain("egg") }
    rendered.should have_selector('#public_notes') { |scope| scope.should contain("Hides behind fridges") }
    rendered.should have_selector('#private_notes') { |scope| scope.should contain("Father cannot approach") }
  end
end
