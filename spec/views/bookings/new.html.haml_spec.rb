require 'spec_helper'

describe "bookings/new.html.haml" do
  before(:each) do
      assign(:booking, stub_model(Booking
      ).as_new_record)
    end

    it "renders a form to create a booking" do
      render
      rendered.should have_selector("form",
                                    :method => "post",
                                    :action => bookings_path) do |form|
        form.should have_selector("select", :name => 'booking[payment_method]')
      end
    end
end
