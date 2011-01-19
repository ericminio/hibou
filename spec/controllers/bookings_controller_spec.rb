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

  it "lists bookings for a given date" do
    Booking.should_receive(:find_bookings_on).with(@date, :am).and_return(@am_bookings)
    Booking.should_receive(:find_bookings_on).with(@date, :pm).and_return(@pm_bookings)
    get :list, :id => "2010-09-21"
    assigns(:schedule_date).should == @date
    assigns(:am_bookings).should == @am_bookings
    assigns(:pm_bookings).should == @pm_bookings
  end


  def mock_booking(stubs={})
    (@mock_child ||= mock_model(Booking).as_null_object).tap do |booking|
      booking.stub(stubs) unless stubs.empty?
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested booking" do
      Booking.should_receive(:find).with("37") { mock_booking }
      mock_booking.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the bookings list" do
      Booking.stub(:find) { mock_booking }
      delete :destroy, :id => "1"
      response.should redirect_to(bookings_url)
    end
  end

end