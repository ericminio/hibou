Then /^the ([^"]*) schedule contains$/ do |period, table|
  table.hashes.each do |child|
    with_scope("##{period}_schedule") do
      page.should have_content(child[:name])
    end
  end
end