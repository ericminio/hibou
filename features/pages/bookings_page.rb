When /^(?:|I) cancel the child ([^"]*) ([^"]*) for ([^"]*) ([^"]*)/ do |first_name, last_name, date, period|
  child = Child.find_by_first_name_and_last_name(first_name, last_name)
  booking = Booking.find_by_child_id_and_date_and_period(child.id, date, period)

  find(:xpath, "//a[@href='/bookings/#{booking.id}' and @data-method='delete']").click
end

def booking_p(child, date, period)
  "//p[#{child_span(child)} and #{date_span(date)} and #{period_span(period)}]"
end

def child_span(child)
  ".//span[contains(.,'#{child}')]"
end

def date_span(date)
  ".//span[contains(.,'#{date}')]"
end

def period_span(period)
  ".//span[contains(.,'#{period}')]"
end