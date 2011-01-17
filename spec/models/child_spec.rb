require 'spec_helper'

describe Child do

  it "is considered allergic when she has an allergy" do
    Child.make(:allergies => 'peanuts').should be_allergic
  end

  it "is not considered allergic when she has no allergy" do
    Child.make(:allergies => '').should_not be_allergic
  end

  it "is considered invalid without a first name" do
    Child.make(:first_name => '').should_not be_valid
  end

  it "is considered invalid without a last name" do
    Child.make(:last_name => '').should_not be_valid
  end

  it "is considered invalid without a birth date" do
    Child.make(:birth_date => '').should_not be_valid
  end

  it "can be round tripped when valid" do
    lambda { Child.make! }.should change(Child, :count).by(1)
  end
    
end
