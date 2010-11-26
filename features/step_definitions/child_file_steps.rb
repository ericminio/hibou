Given /^that "([^"]*)" is registered with the following information:$/ do |child,children_table|
  visit path_to('child registration page')

  children_table.hashes.each do |child|
    fill_in 'child_first_name', :with => child['first name']
    fill_in 'child_last_name', :with => child['last name']
    click 'Save'
  end
end

When /^I consult "([^"]*)"'s file$/ do |child_first_name|
  visit child_path(Child.find_by_first_name(child_first_name))
end

Then /^I see "([^"]*)" as the first name$/ do |first_name|
  page.should have_content(first_name)
end

Then /^"([^"]*)" as the last name$/ do |last_name|
  page.should have_content(last_name)
end