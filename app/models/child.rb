class Child < ActiveRecord::Base
  has_many :bookings

  def allergic?
    not allergies.nil?
  end
end
