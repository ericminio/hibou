Given /^([^"]*) ([^"]*) is already registered at the kindergarden$/ do |first_name, last_name|
  Child.create :first_name => first_name, :last_name => last_name
end

Given /^the secretary registered ([^"]*) ([^"]*) on today for the ([^"]*)$/ do |first_name, last_name, period|
  visit path_to('child booking page')
  select first_name, :from => 'booking[child_id]'
  fill_in 'booking_date', :with => Time.now.strftime("%Y-%m-%d")
  if period == 'afternoon'
    choose 'booking_period_pm'
  else
    choose 'booking_period_am'
  end
  click_button 'Save'
end

Given /^the secretary registered ([^"]*) ([^"]*) on tomorrow for the ([^"]*)$/ do |first_name, last_name, period|
  visit path_to('child booking page')
  select first_name, :from => 'booking[child_id]'
  tomorrow = Time.now + (60 * 60 * 24)
  fill_in 'booking_date', :with => tomorrow.strftime("%Y-%m-%d")
  if period == 'afternoon'
    choose 'booking_period_pm'
  else
    choose 'booking_period_am'
  end
  click_button 'Save'
end

When /^the secretary registered George on December (\d+)st for the ([^"]*)$/ do |arg1, period|
  visit path_to('child booking page')
  select "George", :from => 'booking[child_id]'
  fill_in 'booking_date', :with =>"2010-12-01"
  if period == 'afternoon'
    choose 'booking_period_pm'
  else
    choose 'booking_period_am'
  end
  click_button 'Save'
end

When /I view all bookings/ do
  visit path_to('bookings')
end

When /^I view today's schedule$/ do
  visit path_to('todays schedule')
end

Then /^([^"]*) ([^"]*) is on the schedule$/ do |first_name, last_name|
  page.should have_content("#{first_name} #{last_name}")
  page.should have_content('2010-12-01')
end

Then /^([^"]*) ([^"]*) is on the AM schedule$/ do |first_name, last_name|
  with_scope('#am_schedule') do
    page.should have_content("#{first_name} #{last_name}")
  end
end

Then /^([^"]*) ([^"]*) is on the PM schedule$/ do |first_name, last_name|
  with_scope('#pm_schedule') do
    page.should have_content("#{first_name} #{last_name}")
  end
end


Then /^([^"]*) ([^"]*) is not on either schedule$/ do |first_name, last_name|
  page.should_not have_content("#{first_name} #{last_name}")
end


