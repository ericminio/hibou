class Booking < ActiveRecord::Base
  belongs_to :child
  validates_inclusion_of :period, :in => %w( AM PM )
  validates_presence_of :date, :child, :payment_method

  def Booking::find_am_bookings date
    Booking.where("date = ? AND period = 'AM'", date)
  end

  def Booking::find_pm_bookings date
    Booking.where("date = ? AND period = 'PM'", date)
  end
end
