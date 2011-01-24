module BookingsPage
  def open_new_booking
    find('#add_booking a').click
  end

  def cancel_booking(first_name, last_name, date, period)
    child = Child.find_by_first_name_and_last_name(first_name, last_name)
    booking = Booking.find_by_child_id_and_date_and_period(child.id, date, period)

    page.evaluate_script("window.confirm = function(msg) { return true; }")
    find(:xpath, "//a[@href='/bookings/#{booking.id}' and @data-method='delete']").click
  end
end

World(BookingsPage)