When /^I register as "([^"]*)" with password "([^"]*)"$/ do |email, password|
  within 'form#user_new' do
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    fill_in 'Password confirmation', :with => password
    click_button 'Sign up'
  end
end

Given /^I am registered as "([^"]*)" with password "([^"]*)"$/ do |email, password|
  user = User.new( :email => email,
                   :password => password,
                   :password_confirmation => password).save!
end

Then /^I see a warning telling me the page is inaccessible$/ do
  page.should have_content('The page you were looking for doesn\'t exist.')
end