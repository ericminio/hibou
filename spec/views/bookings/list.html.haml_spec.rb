require "spec_helper"

describe "bookings/list.html.haml" do

  before(:each) do
    assign(:am_bookings, [])
    assign(:pm_bookings, [])

    @day = Date.parse('2011-01-21')
    @next_day = Date.parse('2011-01-22')
    @previous_day = Date.parse('2011-01-20')
    assign(:schedule_date, @day)

    render
  end

  it "displays the schedule date" do
    rendered.should contain(I18n.l(@day, :format => :long))
  end

  it "links to the next schedule" do
    rendered.should have_selector("a", :href => schedule_path(@next_day.to_s(:db)))
  end

  it "links to the previous schedule" do
    rendered.should have_selector("a", :href => schedule_path(@previous_day.to_s(:db)))
  end
end