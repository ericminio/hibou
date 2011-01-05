Before do
  user = User.new(:email => "elvis@memphis.te",
           :password => "hunhun",
           :password_confirmation => "hunhun").save!
  visit new_user_session_path
  fill_in 'user_email', :with => "elvis@memphis.te"
  fill_in 'user_password', :with => 'hunhun'
  click_button 'user_submit'
end