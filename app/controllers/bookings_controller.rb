class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def for_today
    today = Time.now
    date = today.strftime("%Y-%m-%d")   #=> "Printed on 04/09/2003"
    @am_bookings = Booking.find_am_bookings date
    @pm_bookings = Booking.find_pm_bookings date
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new params[:booking]
    if @booking.save
      redirect_to bookings_path
    else
      render :action => "new"
    end
  end

  def delete
  end

end
