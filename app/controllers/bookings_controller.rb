class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def list
    @schedule_date = Date.parse(params[:id])
    @am_bookings = Booking.find_am_bookings @schedule_date
    @pm_bookings = Booking.find_pm_bookings @schedule_date
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
