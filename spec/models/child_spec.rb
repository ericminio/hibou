require 'spec_helper'

describe Child do
  context "when she has allergies" do
    before(:each) do
      @child = Child.new(:first_name => 'Calvin', :last_name => 'Hobbes', :allergies => 'peanuts')
    end

    it "is considered allergic" do
      @child.should be_allergic
    end
  end

  context "when she has no allergy" do
    before(:each) do
      @child = Child.new(:first_name => 'Calvin', :last_name => 'Hobbes', :allergies => '')
    end

    it "is not considered allergic" do
      @child.should_not be_allergic
    end
  end
end
