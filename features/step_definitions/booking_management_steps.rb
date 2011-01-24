Given /^the following bookings$/ do |table|
  administer_bookings
  table.rows.each do |child, date, period|
    open_new_booking
    book_child(child, date, period)
  end
end

When /(?:|I) consult today's schedule/ do
  administer_bookings
end

Then /^the ([^"]*) schedule is/ do |period, bookings|
  Then %{today's #{period} schedule is}, bookings
end

Then /^today's ([^"]*) schedule is/ do |period, bookings|
  schedule_is(period, bookings.hashes)
end

When /^(?:|I) cancel the booking of ([^"]*) ([^"]*) for ([^"]*) ([^"]*)/ do |first_name, last_name, date, period|
  cancel_booking(first_name, last_name, date, period)
  administer_bookings
end