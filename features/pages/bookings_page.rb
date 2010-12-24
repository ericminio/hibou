When /^(?:|I) cancel the child ([^"]*) ([^"]*) for ([^"]*) ([^"]*)/ do |first_name, last_name, date, period|
  child_id = Child.where( :first_name => first_name, :last_name => last_name).first.id
  booking_id = Booking.where( :child_id => child_id, :date => date, :period => period).first.id
  
  find(:xpath, "//a[@href='/bookings/#{booking_id}' and @data-method='delete']").click
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