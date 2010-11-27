When /^I sign out$/ do
  visit destroy_user_session_path
end

Then /^I see the home page$/ do
  page.should have_content("Today's Schedule")
end