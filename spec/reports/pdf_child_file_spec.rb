require 'spec_helper'

describe PDFChildFile do

  before(:each) do
    @pdf = PDFChildFile.new
    @child = Child.new( :first_name => "Tom",
                        :last_name => "Trempe",
                        :birth_date => Date.civil(2007, 03, 23),
                        :snack => true,
                        :bottle => false,
                        :nap => true,
                        :allergies => 'peanuts'
                       )

    new_time = Time.local(2008, 9, 1, 12, 0, 0)
    Timecop.freeze(new_time)

    text = PDF::Inspector::Text.analyze(@pdf.generate_for @child)
    @text_fields = text.strings
  end

  it "should contain the child's name in the first text field" do
   @text_fields.first.should == "Tom Trempe"
  end

  it "should contain the child birth date in its second text field" do
    @text_fields.second.should == "23 mars 2007 plus d'un an"
  end

  it "should have the right options checked" do
    PrawnChildFile.stub(:yes_no_checkbox){}
    @pdf.should_receive(:yes_no_checkbox).with(:snack, :with_yes_checked)
    @pdf.should_receive(:yes_no_checkbox).with(:bottle, :with_no_checked)
    @pdf.should_receive(:yes_no_checkbox).with(:nap, :with_yes_checked)
    @pdf.should_receive(:yes_no_checkbox).with(:allergic, :with_yes_checked)
    @pdf.generate_for @child
  end

  it "should contain the child's allergies its third text field" do
    @text_fields.third.should == "peanuts"
  end

  it "should display an alternative message when the child has no allergies" do
    @pdf = PDFChildFile.new
    @child.allergies = ""
    text = PDF::Inspector::Text.analyze(@pdf.generate_for @child)
    @text_fields = text.strings
    @text_fields.third.should == I18n.translate(:none)
  end


end