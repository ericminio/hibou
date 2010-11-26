Given /^a child registered with first name "([^"]*)" and last name "([^"]*)" and the following notes:$/ do |first_name, last_name, notes|
  # todo navigate via home page
  visit path_to('child registration page')

  with_scope('#new_child') do
    fill_in 'child_first_name', :with => first_name
    fill_in 'child_last_name', :with => last_name
    fill_in 'child_notes', :with => notes
    click_button 'Save'
  end
end

When /^I consult "([^"]*)"'s file$/ do |child_first_name|
  visit path_to('children page')
  page.should have_content(child_first_name)
  # todo: click on the child's link
  child = Child.find_by_first_name(child_first_name)
  visit child_path(child)
end

When /^I see the following notes:$/ do |notes|
  notes.hashes.each do |note|
    page.should have_content(note['text'])
  end
end
Then /^I see that his name is "([^\"]*)"s$/ do |name|
  page.should have_content(name)
end