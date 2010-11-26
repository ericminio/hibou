Given /^George is already registered at the kindergarden$/ do
  Child.create :first_name => "George", :last_name => "Orwell"
end

When /^the secretary registers George on December (\d+)st for the whole day$/ do |arg1|
  visit path_to('child booking page')
  select "George", :from => 'booking[child_id]'
  fill_in 'booking_date', :with =>"2010-12-01"
  choose 'booking_period_whole_day'
  click 'Save'
end

When /I view all bookings/ do
  visit path_to('bookings')
end

Then /^George is on the schedule$/ do
  page.should have_content('George')
  page.should have_content('2010-12-01')
end