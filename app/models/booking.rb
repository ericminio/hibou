class Booking < ActiveRecord::Base
  belongs_to :child

  def Booking::find_am_bookings date
    Booking.where("date = ? AND period = ? OR period = 'whole day'", date, "am")
  end

  def Booking::find_pm_bookings date
    Booking.where("date = ? AND period = ? OR period = 'whole day'", date, "pm")
  end
end
