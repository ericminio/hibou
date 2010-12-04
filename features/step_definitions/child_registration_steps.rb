Given /^([^"]*) ([^"]*) is already registered at the kindergarden$/ do |first_name, last_name|
  Child.create :first_name => first_name, :last_name => last_name, :birth_date => Time.now
end

Given /^the secretary booked ([^"]*) ([^"]*) for today in the ([^"]*)$/ do |first_name, last_name, period|
  visit path_to('child booking page')
  select first_name, :from => 'booking[child_id]'
  today = Time.now
  select today.strftime("%Y"), :from => 'booking_date_1i'
  select I18n.l(today, :format => "%B"), :from => 'booking_date_2i'
  select String(Integer(today.strftime("%d"))), :from => 'booking_date_3i'
  if period == 'afternoon'
    choose 'booking_period_pm'
  else
    choose 'booking_period_am'
  end
  click_button I18n.t(:save)
end

When /^the secretary booked George for today AM with payment method Cash$/ do
  visit path_to('child booking page')
  select 'George', :from => 'booking[child_id]'
  today = Time.now
  select today.strftime("%Y"), :from => 'booking_date_1i'
  select I18n.l(today, :format => "%B"), :from => 'booking_date_2i'
  select String(Integer(today.strftime("%d"))), :from => 'booking_date_3i'
  choose 'booking_period_am'
  select 'Cash', :from => 'booking[payment_method]'
  click_button I18n.t(:save)
end

Given /^the secretary booked ([^"]*) ([^"]*) for tomorrow in the ([^"]*)$/ do |first_name, last_name, period|
  visit path_to('child booking page')
  select first_name, :from => 'booking[child_id]'
  tomorrow = Time.now + (60 * 60 * 24)
  select tomorrow.strftime("%Y"), :from => 'booking_date_1i'
  select I18n.l(tomorrow, :format => "%B"), :from => 'booking_date_2i'
  select String(Integer(tomorrow.strftime("%d"))), :from => 'booking_date_3i'
  if period == 'afternoon'
    choose 'booking_period_pm'
  else
    choose 'booking_period_am'
  end
  click_button I18n.t(:save)
end

When /^the secretary registered George on ([^"]*) ([^"]*) ([^"]*) for the ([^"]*)$/ do |day, month, year, period|
  visit path_to('child booking page')
  select "George", :from => 'booking[child_id]'
  select year, :from => 'booking_date_1i'
  select I18n.l(Date.parse(month), :format => "%B"), :from => 'booking_date_2i'
  select day, :from => 'booking_date_3i'
  if period == 'afternoon'
    choose 'booking_period_pm'
  else
    choose 'booking_period_am'
  end
  click_button I18n.t(:save)
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


