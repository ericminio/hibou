Given /^these children are registered$/ do |table|
  table.hashes.each do |child|
    child['birth date'] ||= Date.today.to_s(:db)
    go_to :child_registration_page
    register_child(child)
  end
end

Given /^the following bookings$/ do |table|
  go_to :home_page
  table.rows.each do |child, date, period|
    go_to :new_booking_page
    book_child(child, date, period)
  end
end

When /^(?:|I) consult today's schedule/ do
  go_to "today's schedule page"
end

When /^I open today's schedule$/ do
  consult_schedule
end

Then /^the ([^"]*) schedule contains$/ do |period, bookings|
  schedule_contains(period, bookings.hashes)
end