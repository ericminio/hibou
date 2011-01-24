Given /^I am registered as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  register_user(email, password)
end

When /^I login as "([^"]*)" using password "([^"]*)"$/ do |email, password|
  go_to :login_page
  login_as(email, password)
end

Then /^I am granted access$/ do
  shows_user_is_authenticated
end

When /^I try to register$/ do
  go_to :registration_page
end

Then /^I am denied access$/ do
  shows_page_does_not_exist
end
