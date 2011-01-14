module AuthenticationHelpers
  def register_user(email, password)
    User.new( :email => email, :password => password, :password_confirmation => password).save!
  end

  def sign_out
    visit destroy_user_session_path
  end

  def shows_page_does_not_exist
    page.should have_content('The page you were looking for doesn\'t exist.')
  end
end

World(AuthenticationHelpers)

Given /^I am not authenticated$/ do
  sign_out
end

Before do
  register_user("elvis@memphis.te","hunhun")
  go_to :login_page
  login_as("elvis@memphis.te","hunhun")
end

