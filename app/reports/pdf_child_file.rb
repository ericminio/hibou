require 'prawn_child_file'

class PDFChildFile < Prawn::Document

  include ActionView::Helpers::DateHelper
  def initialize
    super({ :margin => [0, 0, 0, 0],
            :page_layout => :landscape,
            :page_size => 'LETTER'
          })
  end

  def scanned_child_form
    File.dirname(__FILE__) +'/../../public/images/child_file/scanned_child_file.jpg'
  end

  def full_name_of child
    child.first_name + " " + child.last_name
  end

  def birth_date_of child
    I18n.l(child.birth_date,:format => :medium) + " " + distance_of_time_in_words(child.birth_date, Date.today)
  end

  def  allergies_of_this child
    child.allergic? ? child.allergies : I18n.translate(:none)
  end

  def generate_for(child)
    child_file :scale => 0.95 do
      image scanned_child_form

      text_field :child_name, full_name_of(child)
      text_field :birth_date, birth_date_of(child)

      yes_no_checkbox :snack, child.snack ? :with_yes_checked : :with_no_checked
      yes_no_checkbox :bottle, child.bottle ? :with_yes_checked : :with_no_checked
      yes_no_checkbox :nap, child.nap ? :with_yes_checked : :with_no_checked
      yes_no_checkbox :allergic, child.allergic? ? :with_yes_checked : :with_no_checked

      text_field :allergies, allergies_of_this(child)
    end
    cutting_line

    render
  end
    
end