Given /^these children are registered$/ do |table|
  table.hashes.each do |child_information|
    child_information['birth date'] ||= Date.today.to_s(:db)
    Given %{a child registered with:}, table([child_information]).transpose
  end
end

Given /^the following bookings$/ do |table|
  When %{I go to the home page}
  table.rows.each do |child, date, period|
    When %{I go to the new booking page}
    When %{I book #{child} for #{date} #{period}}
  end
end

When /^(?:|I) consult today's schedule/ do
  When "I open today's schedule"
end

When /^(?:|I) consult the bookings for ([^"]*)$/ do |date|
  When "I go to the #{date} schedule page"
end

When /^(?:|I) cancel the booking of ([^"]*) ([^"]*) for ([^"]*) ([^"]*)$/ do |first_name, last_name, date, period|
  When "I go to the bookings page"
  When "I cancel the child #{first_name} #{last_name} for #{date} #{period}"
end

