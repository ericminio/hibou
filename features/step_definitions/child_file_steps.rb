Given /^a child registered with:$/ do |information|
  # todo navigate via home page
  visit path_to('child registration page')

  information.hashes.each do |child|
    with_scope('#new_child') do
      fill_in 'child_first_name', :with => child['first name']
      fill_in 'child_last_name', :with => child['last name']
      select child['birth year'], :from => 'child_birth_date_1i'
      select child['birth month'], :from => 'child_birth_date_2i'
      select child['birth day'], :from => 'child_birth_date_3i'
      check "Bottle" if child['bottle'] == "yes"
      check "Snack" if child['snack'] == "yes"
      check "Nap" if child['nap'] == "yes"
      fill_in 'child_allergies', :with => child['allergies']
      fill_in 'child_public_notes', :with => child['public notes']
      fill_in 'child_private_notes', :with => child['private notes']
      click_button 'Save'
    end
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
    page.should have_content(note['public'])
    page.should have_content(note['private'])
  end
end

Then /^I see that his name is "([^\"]*)"$/ do |name|
  page.should have_content(name)
end

When /^I see that his birth date is "([^\"]*)"$/ do |birth_date|
  page.should have_content(birth_date)
end

When /^I see that he is allergic to "([^\"]*)"$/ do |allergies|
    page.should have_content(allergies)
end

When /^I see that he expects a bottle$/ do
  with_scope('#child-bottle-yes') do
    page.should have_content('X')
  end
end

When /^I see that he does not expect a snack$/ do
  with_scope('#child-snack-no') do
    page.should have_content('X')
  end
end

When /^I see that he needs a nap$/ do
  with_scope('#child-nap-yes') do
    page.should have_content('X')
  end
end
Then /^I see that George Orwell booking will be paid with Cash$/ do
  page.should have_content('Cash')
end