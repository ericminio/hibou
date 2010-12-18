Then /^the ([^"]*) schedules are/ do |period, table|

  Then "the table within scope ##{period}_schedule has #{table.raw.size} rows"

  table.hashes.each do |child|
    with_scope("##{period}_schedule") do
      page.should have_content(child[:name])
    end
  end
end