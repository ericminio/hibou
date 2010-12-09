When /^(?:|I) book ([^"]*) for ([^"]*) ([^"]*)/ do |child, date, period|
  select child, :from => 'booking_child_id'
  select_date(Date.parse(date))
  choose period == 'am' ? 'booking_period_am' : 'booking_period_pm'
  click_button I18n.t(:save)
end

def select_date(date)
  select date.year().to_s, :from => 'booking_date_1i'
  select I18n.l(date, :format => "%B"), :from => 'booking_date_2i'
  select date.day().to_s, :from => 'booking_date_3i'
end

Then /^the ([^"]*) schedule contains$/ do |period, table|
  table.hashes.each do |child|
    with_scope("##{period}_schedule") do
      page.should have_content(child[:name])
    end
  end
end