module HomePage
  def shows_user_is_authenticated
    page.should have_selector("a.logout")
  end
  
  def administer_bookings
    find('#bookings a').click
  end
  
  def administer_children
    find('#children a').click
  end
end

World(HomePage)