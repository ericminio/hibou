require 'prawn_form'

class ChildFile < Prawn::Document
  include ActionView::Helpers::DateHelper

  WIDGET_OPTIONS = {
      :child_name   => {:at => [62, 275], :width => 274, :height => 26, :padding_left => 5},
      :birth_date   => {:at => [62, 219], :width => 274, :height => 26, :padding_left => 5},
      :snack        => {:at => [207, 185], :width => 13, :height => 18},
      :no_snack     => {:at => [268, 185], :width => 13, :height => 18},
      :bottle       => {:at => [207, 162], :width => 13, :height => 18},
      :no_bottle    => {:at => [268, 162], :width => 13, :height => 18},
      :nap          => {:at => [207, 139], :width => 13, :height => 18},
      :no_nap       => {:at => [268, 139], :width => 13, :height => 18},
      :allergic     => {:at => [207, 100], :width => 13, :height => 18},
      :not_allergic => {:at => [268, 100], :width => 13, :height => 18},
      :allergies    => {:at => [62, 73], :width => 258, :height => 17, :padding_left => 5}
  }

  def initialize(child)
    super({:margin      => [0, 0, 0, 0],
           :page_layout => :landscape,
           :page_size   => 'LETTER'
          })
    @child = child
  end

  def generate
    child_file do
      image scanned_child_form

      text_field widgets.child_name, full_name_of(@child)
      text_field widgets.birth_date, birth_date_of(@child)
      text_field widgets.allergies, allergies_of_this(@child)

      check(@child.snack ? widgets.snack : widgets.no_snack)
      check(@child.bottle ? widgets.bottle : widgets.no_bottle)
      check(@child.nap ? widgets.nap : widgets.no_nap)
      check(@child.allergic? ? widgets.allergic : widgets.not_allergic)
    end
    cutting_line

    render
  end

  def self.widgets
    OpenStruct.new(WIDGET_OPTIONS)
  end

  private
  def widgets
    self.class.widgets
  end

  def child_file(at = [0, 612], scale = 1.0, &block)
    bounding_box at, :width => 792, :height => 306, &block
  end

  def cutting_line
    line_width 1
    horizontal_rule
    dash 5
    stroke_horizontal_rule
  end

  def scanned_child_form
    "#{Rails.root}/public/images/child_file/scanned_child_file.jpg"
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