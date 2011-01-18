module LoginPage
  def login_as(email, password)
    within 'form#new_user' do
      fill_in 'user_email', :with => email
      fill_in 'user_password', :with => password
      click_button 'user_submit'
    end
  end
end

World(LoginPage)