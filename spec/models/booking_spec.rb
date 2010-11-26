require 'spec_helper'

describe Booking do

  describe "find_am_bookings" do
    it "should fetch all the am or whole day bookings for a specific date" do
      roger = Child.new :first_name=> 'Roger', :last_name=> 'Moquin'
      elvis = Child.new :first_name=> 'Elvis', :last_name=> 'Gratton'
      casper = Child.new :first_name=> 'Casper', :last_name=> 'Ghost'
      children = [roger,elvis,casper]
      children.each{|child| child.save}

      am_booking = Booking.new :child => roger, :date => "2010-11-27", :period => 'am'
      pm_booking = Booking.new :child => elvis, :date => "2010-11-27", :period => 'pm'
      whole_day_booking = Booking.new :child => casper, :date => "2010-11-27", :period => 'whole day'
      am_booking_for_another_day = Booking.new :child => roger, :date => "2010-11-28", :period => 'am'

      bookings_array = [am_booking_for_another_day, am_booking,pm_booking, whole_day_booking]
      bookings_array.each {|booking| booking.save}
      bookings = Booking.find_am_bookings "2010-11-27"
      bookings.should include(am_booking, whole_day_booking)
    end
  end

  describe "find_pm_bookings" do
    it "should fetch all the pm or whole day bookings for a specific date" do
      roger = Child.new :first_name=> 'Roger', :last_name=> 'Moquin'
      elvis = Child.new :first_name=> 'Elvis', :last_name=> 'Gratton'
      casper = Child.new :first_name=> 'Casper', :last_name=> 'Ghost'
      children = [roger,elvis,casper]
      children.each{|child| child.save}

      am_booking = Booking.new :child => roger, :date => "2010-11-27", :period => 'am'
      pm_booking = Booking.new :child => elvis, :date => "2010-11-27", :period => 'pm'
      whole_day_booking = Booking.new :child => casper, :date => "2010-11-27", :period => 'whole day'
      am_booking_for_another_day = Booking.new :child => roger, :date => "2010-11-28", :period => 'am'

      bookings_array = [am_booking_for_another_day, am_booking,pm_booking, whole_day_booking]
      bookings_array.each {|booking| booking.save}
      bookings = Booking.find_pm_bookings "2010-11-27"
      bookings.should include(pm_booking)
    end
  end
end
