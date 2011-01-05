When /^I login as "([^"]*)" using password "([^"]*)"$/ do |email, password|
  within 'form#new_user' do
    fill_in 'user_email', :with => email
    fill_in 'user_password', :with => password
    click_button 'user_submit'
  end
end

Given /^I am not logged in$/ do
  visit('/users/sign_out') # ensure that at least
end