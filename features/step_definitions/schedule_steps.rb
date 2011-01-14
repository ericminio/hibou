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

Then /^the ([^"]*) schedule contains$/ do |period, bookings|
  schedule_contains(period, bookings.hashes)
end