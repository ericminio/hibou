require 'prawn_child_file'

class ChildFile < Prawn::Document
  include ActionView::Helpers::DateHelper

  WIDGET_OPTIONS = {
      :child_name => {:at => [62,75], :width => 274, :height => 26, :left_padding => 5},
      :birth_date => {:at => [62, 219], :width => 274, :height => 26, :left_padding => 5},
      :snack      => {:at => [207, 185], :width => 13, :height => 18},
      :no_snack   => {:at => [268, 185], :width => 13, :height => 18},
      :bottle     => {:at => [207, 162], :width => 13, :height => 18},
      :no_bottle  => {:at => [268, 162], :width => 13, :height => 18},
      :nap        => {:at => [207, 139], :width => 13, :height => 18},
      :no_nap     => {:at => [268, 139], :width => 13, :height => 18},
      :allergic   => {:at => [207, 100], :width => 13, :height => 18},
      :allergies  => {:at => [62, 73], :width => 258, :height => 17, :left_padding => 5}
  }

  def initialize(child)
    super({ :margin => [0, 0, 0, 0],
            :page_layout => :landscape,
            :page_size => 'LETTER'
          })
    @child = child
  end

  def generate
    child_file do
      image scanned_child_form

      text_field WIDGET_OPTIONS[:child_name], full_name_of(@child)
      text_field WIDGET_OPTIONS[:birth_date], birth_date_of(@child)

      text_field WIDGET_OPTIONS[:allergies], allergies_of_this(@child)

      check(@child.snack ? WIDGET_OPTIONS[:snack] : WIDGET_OPTIONS[:no_snack])
      check(@child.bottle ? WIDGET_OPTIONS[:bottle] : WIDGET_OPTIONS[:no_bottle])
      check(@child.nap ? WIDGET_OPTIONS[:nap] : WIDGET_OPTIONS[:no_nap])
    end
    cutting_line

    render
  end

  def is_snack_checked
    
  end

  private
  def child_file(at = [0, 306], scale = 1.0, &block)
    bounding_box at, :width => 792, :height => 306, &block
  end

  def cutting_line
    move_down 5
    line_width 1
    horizontal_rule
    dash 5
    stroke_horizontal_rule
    move_down 5
  end

  def scanned_child_form
    File.dirname(__FILE__) +'/../../public/images/child_file/scanned_child_file.jpg'
  end

  #todo use child.full_name
  def full_name_of child
    child.first_name + " " + child.last_name
  end

  def birth_date_of child
    "#{I18n.l(child.birth_date, :format => :medium)} (#{distance_of_time_in_words(child.birth_date, Date.today)})"
  end

  def  allergies_of_this child
    child.allergic? ? child.allergies : I18n.translate(:none)
  end
end