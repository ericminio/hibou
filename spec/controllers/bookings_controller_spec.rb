require "spec_helper"

describe BookingsController do

  before :each do
    @date = Date.parse("2010-09-21")
    @am_bookings = [Booking.new]
    @pm_bookings = [Booking.new, Booking.new]

    @user = User.create(:email => "elvis@memphis.te",
           :password => "hunhun",
           :password_confirmation => "hunhun")
    sign_in @user
  end

  it "list bookings for a given date" do
    Booking.should_receive(:find_am_bookings).with(@date).and_return(@am_bookings)
    Booking.should_receive(:find_pm_bookings).with(@date).and_return(@pm_bookings)
    get :list, :id => "2010-09-21"
    assigns(:schedule_date).should == @date
    assigns(:am_bookings).should == @am_bookings
    assigns(:pm_bookings).should == @pm_bookings
  end
end