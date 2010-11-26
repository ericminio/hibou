class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
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
