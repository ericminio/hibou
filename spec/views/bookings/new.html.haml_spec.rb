require 'spec_helper'

describe "bookings/new.html.haml" do
  before(:each) do
    assign(:booking, stub_model(Booking).as_new_record)
  end

  it "renders a list for the payment methods" do
    render
    rendered.should have_selector("form") do |form|
      form.should have_selector("select", :name => 'booking[payment_method]') do |select|
        select.should have_selector("option", :value => 'Cash')
        select.should have_selector("option", :value => 'Cheque')
        select.should have_selector("option", :value => 'Sipple')
        select.should have_selector("option", :value => 'DPJ')
        select.should have_selector("option", :value => 'CISC')
        select.should have_selector("option", :value => 'Fond Social')
        select.should have_selector("option", :value => 'Autre')
      end
    end
  end
end
