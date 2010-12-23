class Booking < ActiveRecord::Base
  belongs_to :child
  validates_inclusion_of :period, :in => %w( AM PM )
  validates_presence_of :date, :child, :payment_method

  def Booking::find_bookings_on(date, period)
    Booking.where("date = ? AND period = ?", date, period.to_s.upcase)
  end
end
