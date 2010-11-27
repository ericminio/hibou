require 'spec_helper'

describe Booking do

  describe "structure" do
    it "should require the period to be either AM or PM" do
      roger = Child.new :first_name=> 'Roger', :last_name=> 'Moquin'
      booking = Booking.create :child => roger, :date => "2010-11-27", :period => 'unknown'
      booking.save.should be_false
    end

    it "should allow AM as the period" do
      roger = Child.new :first_name=> 'Roger', :last_name=> 'Moquin'
      booking = Booking.create :child => roger, :date => "2010-11-27", :period => 'AM'
      booking.save.should be_true
    end
  end

  describe "find_am_bookings" do
    it "should fetch all the AM bookings for a specific date" do
      roger = Child.new :first_name=> 'Roger', :last_name=> 'Moquin'
      elvis = Child.new :first_name=> 'Elvis', :last_name=> 'Gratton'
      casper = Child.new :first_name=> 'Casper', :last_name=> 'Ghost'
      children = [roger,elvis,casper]
      children.each{|child| child.save}

      am_booking = Booking.new :child => roger, :date => "2010-11-27", :period => 'AM'
      pm_booking = Booking.new :child => elvis, :date => "2010-11-27", :period => 'PM'
      am_booking_for_another_day = Booking.new :child => roger, :date => "2010-11-28", :period => 'AM'

      bookings_array = [am_booking_for_another_day, am_booking,pm_booking]
      bookings_array.each {|booking| booking.save}
      bookings = Booking.find_am_bookings "2010-11-27"
      bookings.should include(am_booking)

    end

  end

  describe "find_pm_bookings" do
    it "should fetch all the PM bookings for a specific date" do
      roger = Child.new :first_name=> 'Roger', :last_name=> 'Moquin'
      elvis = Child.new :first_name=> 'Elvis', :last_name=> 'Gratton'
      casper = Child.new :first_name=> 'Casper', :last_name=> 'Ghost'
      children = [roger,elvis,casper]
      children.each{|child| child.save}

      am_booking = Booking.new :child => roger, :date => "2010-11-27", :period => 'AM'
      pm_booking = Booking.new :child => elvis, :date => "2010-11-27", :period => 'PM'
      am_booking_for_another_day = Booking.new :child => roger, :date => "2010-11-28", :period => 'AM'

      bookings_array = [am_booking_for_another_day, am_booking,pm_booking]
      bookings_array.each {|booking| booking.save}
      bookings = Booking.find_pm_bookings "2010-11-27"
      bookings.should include(pm_booking)
    end
  end
end
