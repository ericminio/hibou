Given /^George is already registered at the kindergarden$/ do
  Child.create :first_name => "George", :last_name => "Orwell"
end

When /^the secretary registers George for December (\d+)st$/ do |arg1|
  visit path_to('child booking page')
  select "George", :from => 'booking[child_id]'
  fill_in 'booking_date', :with =>"2010-12-01"
  click 'Save'
end

Then /^George is on the December (\d+)st schedule$/ do |arg1|
  visit path_to('bookings')
  page.should have_content('George')
  page.should have_content('2010-12-01')
end