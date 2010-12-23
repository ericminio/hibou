class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
  end

  def list
    @schedule_date = Date.parse(params[:id])
    @am_bookings = Booking.find_bookings_on(@schedule_date, :am)
    @pm_bookings = Booking.find_bookings_on(@schedule_date, :pm)
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
