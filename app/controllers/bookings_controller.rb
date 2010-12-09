class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def list
    @am_bookings = Booking.find_am_bookings Date.parse(params[:id])
    @pm_bookings = Booking.find_pm_bookings Date.parse(params[:id])
    render 'for_today'
  end

  def for_today
    today = Time.now
    date = today.strftime("%Y-%m-%d")   #=> "Printed on 04/09/2003"
    @am_bookings = Booking.find_am_bookings date
    @pm_bookings = Booking.find_pm_bookings date
  end

  def new
    @booking = Booking.new
    @payment_methods = ["Cash", 'Cheque', 'Sipple', 'DPJ', 'CISC', 'Fond Social', 'Autre']
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
