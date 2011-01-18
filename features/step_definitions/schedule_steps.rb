Given /^these children are registered$/ do |table|
  table.hashes.each do |child|
    child['birth date'] ||= Date.today.to_s(:db)
    administer_children
    open_child_registration
    register_child(child)
  end
end

Given /^the following bookings$/ do |table|
  administer_bookings
  table.rows.each do |child, date, period|
    open_new_booking
    book_child(child, date, period)
  end
end

When /^(?:|I) consult today's schedule/ do
  administer_bookings
end

Then /^the ([^"]*) schedule is/ do |period, bookings|
  schedule_is(period, bookings.hashes)
end

When /^(?:|I) cancel the booking of ([^"]*) ([^"]*) for ([^"]*) ([^"]*)/ do |first_name, last_name, date, period|
  child = Child.find_by_first_name_and_last_name(first_name, last_name)
  booking = Booking.find_by_child_id_and_date_and_period(child.id, date, period)

  find(:xpath, "//a[@href='/bookings/#{booking.id}' and @data-method='delete']").click
end
