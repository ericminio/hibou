require 'spec_helper'

describe ChildFile do

  def corners(widget)
    corners = []
    corners << [widget[:left], widget[:top]]
    corners << [widget[:left] + widget[:width], widget[:top] ]
    corners << [widget[:left] + widget[:width], widget[:top] - widget[:height] ]
    corners << [widget[:left], widget[:top] - widget[:height] ]
    corners
  end

  describe "for all children" do
    before(:each) do
      @child = Child.make(:first_name => "Tom",
                         :last_name => "Trempe",
                         :birth_date => Date.civil(2007, 03, 23))
      @pdf = ChildFile.new(@child)

      new_time = Time.local(2008, 9, 1, 12, 0, 0)
      Timecop.freeze(new_time)

      text = PDF::Inspector::Text.analyze(@pdf.generate)
      @text_fields = text.strings
    end

    it "should contain the child's name in the first text field" do
      @text_fields.first.should == "Tom Trempe"
    end

    it "should contain the child birth date in its second text field" do
      @text_fields.second.should == "23 mars 2007 (plus d'un an)"
    end
  end

  describe "when child expects a snack" do
    before(:each) do
      @child = Child.make(:snack => true)
      @lines = PDF::Inspector::Graphics::Line.analyze(ChildFile.new(@child).generate)
    end

    it "should tick the snack checkbox" do
      @lines.points.should include(*corners(PrawnChildFile::WIDGETS[:snack]))
      @lines.points.should_not include(*corners(PrawnChildFile::WIDGETS[:no_snack]))
    end

  end

  describe "when child expects a bottle" do
    before(:each) do
      @child = Child.make(:bottle => true)
      @lines = PDF::Inspector::Graphics::Line.analyze(ChildFile.new(@child).generate)
    end

    it "should tick the bottle checkbox" do
      @lines.points.should include(*corners(PrawnChildFile::WIDGETS[:bottle]))
      @lines.points.should_not include(*corners(PrawnChildFile::WIDGETS[:no_bottle]))
    end
  end

  describe "when child requires a nap" do
    before(:each) do
      @child = Child.make(:nap => true)
      @lines = PDF::Inspector::Graphics::Line.analyze(ChildFile.new(@child).generate)
    end

    it "should tick the nap checkbox" do
      @lines.points.should include(*corners(PrawnChildFile::WIDGETS[:nap]))
      @lines.points.should_not include(*corners(PrawnChildFile::WIDGETS[:no_nap]))
    end
  end

  describe "when a child has allergies" do
    before(:each) do
      @child = Child.make(:allergies => "peanuts")
      @texts = PDF::Inspector::Text.analyze(ChildFile.new(@child).generate).strings
    end

    it "should contain show the child's allergies in its third text field" do
      @texts.should include("peanuts")
    end
  end

  describe "when a child has no allergies" do
    before(:each) do
      @child = Child.make(:allergies => nil)
      text = PDF::Inspector::Text.analyze(ChildFile.new(@child).generate)
      @texts = text.strings
    end

    it "should display an alternative message" do
      @texts.third.should == I18n.translate(:none)
    end
  end

end