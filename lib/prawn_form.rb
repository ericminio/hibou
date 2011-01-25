require 'rubygems'
require 'prawn'

module PrawnForm

  def text_field(text, options = {}, &block)
    widget(options) do
      text_box text,
               :at       => [bounds.left, bounds.top],
               :width    => bounds.right,
               :valign   => options[:valign] || :center,
               :overflow => options[:overflow] || :truncate,
               &block
    end
  end

  def text_area(text, options = {}, &block)
    text_field(text, {:overflow => :ellipses, :valign => :top}.merge(options), &block)
  end

  def check(options = {})
    widget(options) do
      stroke do
        line [bounds.left, bounds.top], [bounds.right, bounds.bottom]
        line [bounds.left, bounds.bottom], [bounds.right, bounds.top]
      end
    end
  end

  private
  def widget(options = {}, &block)
    at             = options[:at] || [bounds.left, bounds.top]
    width          = options[:width] || bounds.right - at[0]
    height         = options[:height] || at[1] - bounds.bottom

    padding        = options[:padding] || 0
    padding_left   = options[:padding_left] || padding
    padding_right  = options[:padding_right] || padding
    padding_top    = options[:padding_top] || padding
    padding_bottom = options[:padding_bottom] || padding

    bounding_box([at[0] + padding_left,
                  at[1] - padding_top],
                 :width  => width - (padding_left + padding_right),
                 :height => height - (padding_bottom + padding_top),
                 &block)
  end

end

Prawn::Document.extensions << PrawnForm