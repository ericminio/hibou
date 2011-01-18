require 'spec_helper'

describe "bookings/index.html.haml" do

  it "should allow cancellation" do
    assign(:bookings, [Booking.make])
    render
    rendered.should have_selector("a") do |link|
      link.should contain( t(:cancel) )
    end
  end


end
