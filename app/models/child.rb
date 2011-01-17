class Child < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :birth_date
  
  has_many :bookings

  def allergic?
    not allergies.blank?
  end

end
