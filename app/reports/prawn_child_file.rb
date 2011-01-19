require 'rubygems'
require 'prawn'

module PrawnChildFile
  size    = 'LETTER'

  WIDGETS = {
      :child_name => {:left => 62, :top => 275, :width => 274, :height => 26},
      :birth_date => {:left => 62, :top => 219, :width => 274, :height => 26},
      :snack      => {:left => 207, :top => 185, :width => 13, :height => 18},
      :no_snack   => {:left => 268, :top => 185, :width => 13, :height => 18},
      :bottle     => {:left => 207, :top => 162, :width => 13, :height => 18},
      :no_bottle  => {:left => 268, :top => 162, :width => 13, :height => 18},
      :nap        => {:left => 207, :top => 139, :width => 13, :height => 18},
      :no_nap     => {:left => 268, :top => 139, :width => 13, :height => 18},
      :allergic   => {:left => 207, :top => 100, :width => 13, :height => 18},
      :allergies  => {:left => 62, :top => 73, :width => 258, :height => 17}
  }

  def child_file(at = [0, 306], scale = 1.0, &block)
    bounding_box at, :width => 792, :height => 306, &block
  end

  def text_field name, text, &block
    widget(name, :padding_left => 5) do
      text_box text,
               :at     => [bounds.left, bounds.top],
               :width  => bounds.right,
               :valign => :center, :overflow => :truncate,
               &block
    end
  end

  def check name
    widget(name) do
      stroke do
        line [bounds.left, bounds.top], [bounds.right, bounds.bottom]
        line [bounds.left, bounds.bottom], [bounds.right, bounds.top]
      end
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

  private
  def widget(name, options = {}, &block)
    padding        = options[:padding] || 0
    padding_left   = options[:padding_left] || padding
    padding_right  = options[:padding_right] || padding
    padding_top    = options[:padding_top] || padding
    padding_bottom = options[:padding_bottom] || padding

    bounding_box([bounds.left + WIDGETS[name][:left] + padding_left,
                  bounds.bottom + WIDGETS[name][:top] - padding_top],
                 :width  => WIDGETS[name][:width] - (padding_left + padding_right),
                 :height => WIDGETS[name][:height] - (padding_bottom + padding_top),
                 &block)
  end

end

Prawn::Document.extensions << PrawnChildFile