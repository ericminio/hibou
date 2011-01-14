module HomePage
  def shows_user_is_authenticated
    page.should have_selector("a.logout")
  end

  def consult_schedule
    click_link 'schedule_of_the_day'
  end
end

World(HomePage)