require 'spec_helper'

describe ChildFile do

  def corners(widget)
    corners = []
    corners << [widget[:at][0], widget[:at][1]]
    corners << [widget[:at][0] + widget[:width], widget[:at][1] ]
    corners << [widget[:at][0] + widget[:width], widget[:at][1] - widget[:height] ]
    corners << [widget[:at][0], widget[:at][1] - widget[:height] ]
    corners
  end

  describe "for all children" do
    before(:each) do
      @child = Child.make(:first_name => "Tom",
                         :last_name => "Trempe",
                         :birth_date => Date.civil(2007, 03, 23))
      @texts = PDF::Inspector::Text.analyze(ChildFile.new(@child).generate).strings
    end

    it "contains the child's name in the first text field" do
      @texts.first.should == "Tom Trempe"
    end

    it "contains the child birth date in its second text field" do
      @texts.second.should =~ /#{I18n.l(@child.birth_date, :format => :medium)}/
    end
  end

  describe "when child expects a snack" do
    before(:each) do
      @child = Child.make(:snack => true)
      @child_file = ChildFile.new(@child, :at => [0, 306])
      @lines = PDF::Inspector::Graphics::Line.analyze(@child_file.generate)
    end

    it "ticks the snack checkbox" do
      @lines.points.should include(*corners(ChildFile.widgets.snack))
      @lines.points.should_not include(*corners(ChildFile.widgets.no_snack))
    end

  end

  describe "when child expects a bottle" do
    before(:each) do
      @child = Child.make(:bottle => true)
      @child_file = ChildFile.new(@child, :at => [0, 306])
      @lines = PDF::Inspector::Graphics::Line.analyze(@child_file.generate)
    end

    it "ticks the bottle checkbox" do
      @lines.points.should include(*corners(ChildFile.widgets.bottle))
      @lines.points.should_not include(*corners(ChildFile.widgets.no_bottle))
    end
  end

  describe "when child requires a nap" do
    before(:each) do
      @child = Child.make(:nap => true)
      @child_file = ChildFile.new(@child, :at => [0, 306])
      @lines = PDF::Inspector::Graphics::Line.analyze(@child_file.generate)
    end

    it "ticks the nap checkbox" do
      @lines.points.should include(*corners(ChildFile.widgets.nap))
      @lines.points.should_not include(*corners(ChildFile.widgets.no_nap))
    end
  end

  describe "when a child has allergies" do
    before(:each) do
      @child = Child.make(:allergies => "peanuts")
      @child_file = ChildFile.new(@child, :at => [0, 306])
      @rendered_child_file = @child_file.generate
      @texts = PDF::Inspector::Text.analyze(@rendered_child_file).strings
      @lines = PDF::Inspector::Graphics::Line.analyze(@rendered_child_file)
    end

    it "ticks the allergies checkbox" do
      @lines.points.should include(*corners(ChildFile.widgets.allergic))
      @lines.points.should_not include(*corners(ChildFile.widgets.not_allergic))
    end

    it "contains the child's allergies in its third text field" do
      @texts.should include("peanuts")
    end
  end

  describe "when a child has no allergies" do
    before(:each) do
      @child = Child.make(:allergies => nil)
      @texts = PDF::Inspector::Text.analyze(ChildFile.new(@child).generate).strings
    end

    it "displays an alternative message" do
      @texts.third.should == I18n.translate(:none)
    end
  end

  describe "when a child has public notes" do
    describe "and that these notes are short" do
      before(:each) do
        @child = Child.make(:public_notes => "loves bananas")
        @child_file = ChildFile.new(@child, :at => [0, 306])
        @texts = PDF::Inspector::Text.analyze(@child_file.generate).strings
      end

      it "contains these complete notes" do
        @texts.fourth.should == "loves bananas"
      end
    end

    describe "and that these notes are too long to fit the text area" do
      before(:each) do
        @child = Child.make(:public_notes => "a very very very very very very very very very very very very very very very very very very very very very very long note")
        @child_file = ChildFile.new(@child, :at => [0, 306])
        @texts = PDF::Inspector::Text.analyze(@child_file.generate).strings
      end

      it "contains an elipsized version of these notes" do
        texts_should_match(/a very/)
        texts_should_match(/very.../)
      end

      def texts_should_match(regex)
        @texts.select {|line| line =~ regex}.should_not be_empty
      end
    end
  end

  describe "when a child has private notes" do
    describe "and that these notes are not too long" do
      before(:each) do
        @child = Child.make(:public_notes => "loves bananas", :private_notes => "but don't tell anyone")
        @child_file = ChildFile.new(@child, :at => [0, 306])
        @texts = PDF::Inspector::Text.analyze(@child_file.generate).strings
      end

      it "contains these complete notes" do
        @texts.fifth.should == "but don't tell anyone"
      end
    end
  end
end