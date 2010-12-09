When /^I sign out$/ do
  visit destroy_user_session_path
end

Given /^I am signed out$/ do
  visit destroy_user_session_path
end

Then /^I see the home page$/ do
  page.should have_content(I18n.t :menu_todays_schedule)
end

When /^I decide to create a new booking$/ do
 click_link "new_booking"
end