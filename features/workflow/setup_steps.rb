Before do
  user = User.new(:email => "elvis@memphis.te",
           :password => "hunhun",
           :password_confirmation => "hunhun").save!
  visit new_user_session_path
  fill_in 'Email', :with => "elvis@memphis.te"
  fill_in 'Password', :with => 'hunhun'
  click_button 'Sign in'
end