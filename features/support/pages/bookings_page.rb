module BookingsPage
  def open_new_booking
    find('#add_booking a').click
  end
end

World(BookingsPage)