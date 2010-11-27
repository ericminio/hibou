require 'spec_helper'

describe Booking do


  describe "validation rules" do

    before(:each) do
      @child                    = Child.create(:first_name => 'Calvin', :last_name => 'Hobbes', :birth_date => Date.today)
      @booking_valid_attributes = {:child => @child, :period => 'AM', :date => Date.today, :payment_method => 'Cash'}
    end

    def booking_with(attributes={})
      Booking.new(@booking_valid_attributes.merge!(attributes))
    end

    it "is considered invalid without a period" do
      booking_with(:period => '').should_not be_valid
    end
    it "is considered invalid without a date" do
      booking_with(:date => '').should_not be_valid
    end
    it "is considered invalid without a child" do
      booking_with(:child => nil).should_not be_valid
    end
    it "is considered invalid with an unknown period" do
      booking_with(:period => 'unknown').should_not be_valid
    end
    it "is considered invalid without a payment method" do
      booking_with(:payment_method => '').should_not be_valid
    end

  end

  describe "find_am_bookings" do
    it "should fetch all the AM bookings for a specific date" do
      roger    = Child.new :first_name=> 'Roger', :last_name=> 'Moquin'
      elvis    = Child.new :first_name=> 'Elvis', :last_name=> 'Gratton'
      casper   = Child.new :first_name=> 'Casper', :last_name=> 'Ghost'
      children = [roger, elvis, casper]
      children.each { |child| child.save }

      am_booking                 = Booking.new :child => roger, :date => "2010-11-27", :period => 'AM', :payment_method => 'Cash'
      pm_booking                 = Booking.new :child => elvis, :date => "2010-11-27", :period => 'PM', :payment_method => 'Cash'
      am_booking_for_another_day = Booking.new :child => roger, :date => "2010-11-28", :period => 'AM', :payment_method => 'Cash'

      bookings_array             = [am_booking_for_another_day, am_booking, pm_booking]
      bookings_array.each { |booking| booking.save }
      bookings = Booking.find_am_bookings "2010-11-27"
      bookings.should include(am_booking)

    end

  end

  describe "find_pm_bookings" do
    it "should fetch all the PM bookings for a specific date" do
      roger    = Child.new :first_name=> 'Roger', :last_name=> 'Moquin'
      elvis    = Child.new :first_name=> 'Elvis', :last_name=> 'Gratton'
      casper   = Child.new :first_name=> 'Casper', :last_name=> 'Ghost'
      children = [roger, elvis, casper]
      children.each { |child| child.save }

      am_booking                 = Booking.new :child => roger, :date => "2010-11-27", :period => 'AM', :payment_method => 'Cash'
      pm_booking                 = Booking.new :child => elvis, :date => "2010-11-27", :period => 'PM', :payment_method => 'Cash'
      am_booking_for_another_day = Booking.new :child => roger, :date => "2010-11-28", :period => 'AM', :payment_method => 'Cash'

      bookings_array             = [am_booking_for_another_day, am_booking, pm_booking]
      bookings_array.each { |booking| booking.save }
      bookings = Booking.find_pm_bookings "2010-11-27"
      bookings.should include(pm_booking)
    end
  end
end
