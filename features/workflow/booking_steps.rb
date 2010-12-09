Given /^these children are registered$/ do |table|
  table.rows.each do |first_name, last_name|
    Child.create :first_name => first_name, :last_name => last_name, :birth_date => Time.now
  end
end

Given /^the following bookings$/ do |table|
  When %{I go to the home page}
  table.rows.each do |child, date, period|
    When %{I go to the new booking page}
    When %{I book #{child} for #{date} #{period}}
  end
end

When /^(?:|I) consult the bookings for ([^"]*)$/ do |date|
  visit ("/schedules/#{date}")
end