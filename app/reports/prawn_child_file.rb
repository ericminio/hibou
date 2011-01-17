require 'rubygems'
require 'prawn'

module PrawnChildFile
  size = 'LETTER'

  WIDGETS = {
    :child_name => { :position => {:left => 62, :top => 31}, :width => 274, :height => 26, :padding_left => 5},
    :birth_date => { :position => {:left => 62, :top => 87}, :width => 274, :height => 26, :padding_left => 5},
    :snack => {:position => {:left => 205, :top => 120}, :width => 80, :height => 18, :padding_left => 5},
    :bottle=> {:position => {:left => 205, :top => 144}, :width => 80, :height => 18, :padding_left => 5},
    :nap =>  {:position => {:left => 205, :top => 168}, :width => 80, :height => 18, :padding_left => 5},
    :allergic =>  {:position => {:left => 205, :top => 205}, :width => 80, :height => 18, :padding_left => 5},
    :allergies => { :position => {:left => 62, :top => 232}, :width => 274, :height => 26, :padding_left => 5},
    :yes_checkbox => {:left => 1, :width => 14, :height => 19},
    :no_checkbox => {:left => 62, :width => 14, :height => 19},
  }

  def child_file scale, &block_to_execute
        bounding_box [bounds.left, bounds.top], :width => 792, :height => 306, &block_to_execute
  end

  def text_field name, text, &block_to_execute
    widget = WIDGETS[name]
    bounding_box  [bounds.left + widget[:position][:left], bounds.top - widget[:position][:top]], :height => widget[:height], :width => widget[:width] do
      text_box text, :at => [bounds.left + widget[:padding_left], bounds.top],
                     :width => bounds.right - widget[:padding_left],
                     :valign => :center, :overflow => :truncate,
                     &block_to_execute
    end
  end

  def checkbox name, checked
    widget = WIDGETS[name]
    bounding_box [bounds.left + widget[:left] ,bounds.top], :width=>widget[:width], :height=>widget[:height] do
      if checked
        stroke do
          line [bounds.left,bounds.top], [bounds.right,bounds.bottom]
          line [bounds.left,bounds.bottom], [bounds.right,bounds.top]
        end
      end
    end
  end

  def yes_no_checkbox name, selection
    widget = WIDGETS[name]
    bounding_box  [bounds.left + widget[:position][:left], bounds.top - widget[:position][:top]], :height =>widget[:height], :width =>widget[:width] do
      checkbox :yes_checkbox, selection == :with_yes_checked
      checkbox :no_checkbox, selection == :with_no_checked
    end
  end

  def cutting_line
    move_down 5
    line_width 1
    horizontal_rule
    dash 5
    stroke_horizontal_rule
    move_down 5
  end


end

Prawn::Document.extensions << PrawnChildFile