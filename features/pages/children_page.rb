When /(?:|I) open ([^"]*) ([^"]*)'s file/ do |first_name, last_name|
  child = Child.find_by_first_name_and_last_name(first_name, last_name)

  with_scope("#child_#{child.id}") do
    click_link first_name
  end
end
