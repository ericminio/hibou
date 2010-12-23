require "spec_helper"

describe "Schedules routes" do

  specify "/schedules/:date to BookingsController#list" do
    {:get => "/schedules/2010-12-01"}.should route_to(:controller => "bookings", :action => "list", :id => '2010-12-01')
  end
end