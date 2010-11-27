When /^I register as "([^"]*)" with password "([^"]*)"$/ do |email, password|
  within 'form#user_new' do
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    fill_in 'Password confirmation', :with => password
    click_button 'Sign up'
  end
end