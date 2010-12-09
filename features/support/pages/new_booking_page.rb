When /^(?:|I) book ([^"]*) for ([^"]*) ([^"]*)/ do |child, date, period|
  booking_date = Date.parse(date)
  select child, :from => 'booking_child_id'
  select booking_date.year().to_s, :from => 'booking_date_1i'
  select I18n.l(booking_date, :format => "%B"), :from => 'booking_date_2i'
  select booking_date.day().to_s, :from => 'booking_date_3i'
  choose period == 'am' ? 'booking_period_am' : 'booking_period_pm'
  click_button I18n.t(:save)
end

Then /^the am's schedule contains$/ do |table|
  table.rows.each do |child|
    Then %{I should see "#{child}" within "#am_schedule"}
  end
end

Then /^the pm's schedule contains$/ do |table|
  table.rows.each do |child|
    Then %{I should see "#{child}" within "#pm_schedule"}
  end
end