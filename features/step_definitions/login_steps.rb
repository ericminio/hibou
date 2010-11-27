When /^I login as "([^"]*)" using password "([^"]*)"$/ do |email, password|
  within 'form#user_new' do
    fill_in 'Email', :with => email
    fill_in 'Password', :with => password
    click_button 'Sign in'
  end
end