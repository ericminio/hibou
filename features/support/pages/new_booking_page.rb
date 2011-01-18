module NewBookingPage
  def book_child(child, date, period)
    within("#new_booking") do
      select child, :from => 'booking_child_id'
      select_booking_date(Date.parse(date))
      choose period == 'am' ? 'booking_period_am' : 'booking_period_pm'
      click_button 'booking_submit'
    end
  end

  def select_booking_date(date)
    select date.year.to_s, :from => 'booking_date_1i'
    select I18n.l(date, :format => "%B"), :from => 'booking_date_2i'
    select date.day.to_s, :from => 'booking_date_3i'
  end
end

World(NewBookingPage)