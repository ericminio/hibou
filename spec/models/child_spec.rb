require 'spec_helper'

describe Child do

  before(:each) do
    @valid_attributes = {:first_name => 'Calvin', :last_name => 'Hobbes', :birth_date => Date.today}
  end

  def child_with(attributes={})
    Child.new(@valid_attributes.merge!(attributes))
  end

  specify "is considered allergic when she has an allergy" do
    child_with(:allergies => 'peanuts').should be_allergic
  end

  specify "is not considered allergic when she has no allergy" do
    child_with(:allergies => '').should_not be_allergic
  end

  specify "is considered invalid without a first name" do
    child_with(:first_name => '').should_not be_valid
  end

  specify "is considered invalid without a last name" do
    child_with(:last_name => '').should_not be_valid
  end

  specify "is considered invalid without a birth date" do
    child_with(:birth_date => '').should_not be_valid
  end

  specify "can be round tripped when valid" do
    lambda {
      Child.create!(@valid_attributes)
    }.should change(Child, :count).by(1)
  end

end
