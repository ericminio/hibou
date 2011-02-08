require 'prawn_form'

class ChildFile < Prawn::Document
  include ActionView::Helpers::DateHelper

  WIDGETS = {
      :child_name => {:at => [62, 274], :width => 274, :height => 26, :padding_left => 5},
      :birth_date => {:at => [62, 218], :width => 274, :height => 26, :padding_left => 5},
      :snack => {:at => [206, 186], :width => 14, :height => 19},
      :no_snack => {:at => [267, 186], :width => 14, :height => 19},
      :bottle => {:at => [206, 163], :width => 14, :height => 19},
      :no_bottle => {:at => [268, 162], :width => 14, :height => 19},
      :nap => {:at => [206, 138], :width => 14, :height => 19},
      :no_nap => {:at => [268, 138], :width => 14, :height => 19},
      :allergic => {:at => [205, 101], :width => 14, :height => 19},
      :not_allergic => {:at => [267, 101], :width => 14, :height => 19},
      :allergies => {:at => [62, 72], :width => 258, :height => 17, :padding_left => 5},
      :public_notes => {:at => [62, 48], :width => 258, :height => 45, :padding_left => 5, :padding_top => 20},
      :private_notes => {:at => [458, 300], :width => 257, :height => 281, :padding_left => 5, :padding_top => 20}
  }

  def self.widgets
    OpenStruct.new(WIDGETS)
  end

  def initialize(child, options = {})
    super({:margin => [0, 0, 0, 0],
           :page_layout => :landscape,
           :page_size => 'LETTER'})
    @options = {:at => [0, 612]}.merge(options)
    @child = child
  end

  def generate
    child_file do
      image child_form_background

      text_field full_name_of(@child), widgets.child_name
      text_field birth_date_of(@child), widgets.birth_date
      text_field allergies_of_this(@child), widgets.allergies

      line_width 2
      check(@child.snack ? widgets.snack : widgets.no_snack)
      check(@child.bottle ? widgets.bottle : widgets.no_bottle)
      check(@child.nap ? widgets.nap : widgets.no_nap)
      check(@child.allergic? ? widgets.allergic : widgets.not_allergic)

      text_area public_notes_of(@child), widgets.public_notes
      text_area private_notes_of(@child), widgets.private_notes
    end
    cutting_line

    render
  end

  private
  def widgets
    self.class.widgets
  end

  def public_notes_of(child)
    child.public_notes || ""
  end

  def private_notes_of(child)
    child.private_notes || ""
  end

  def child_file(&block)
    bounding_box @options[:at], :width => 792, :height => 306, &block
  end

  def cutting_line
    line_width 1
    horizontal_rule
    dash 5
    stroke_horizontal_rule
  end

  def child_form_background
    "#{Rails.root}/public/images/child_file/child_file_background.jpg"
  end

  def full_name_of child
    child.full_name
  end

  def birth_date_of child
    "#{I18n.l(child.birth_date, :format => :medium)} (#{distance_of_time_in_words(child.birth_date, Date.today)})"
  end

  def allergies_of_this child
    child.allergic? ? child.allergies : I18n.translate(:none)
  end

end