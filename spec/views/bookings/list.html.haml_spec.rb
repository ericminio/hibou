require "spec_helper"

describe "bookings/list.html.haml" do

  before(:each) do
    assign(:am_bookings, [])
    assign(:pm_bookings, [])
    @date = Date.parse('2011-01-01')
  end

  it "should display the schedule date" do
    assign(:schedule_date, @date)
    render
    rendered.should contain(I18n.l @date, :format => :medium)
  end
end