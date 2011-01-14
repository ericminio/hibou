Given /^a child registered with:$/ do |information|
  go_to :child_registration_page
  register_child(information.rows_hash)
end

When /^I consult "([^"]*)" "([^"]*)"'s file$/ do |first_name, last_name|
  go_to :children_page
  open_child_file(first_name, last_name)
end

Then /^(?:|I) see the following notes:$/ do |notes|
  notes.hashes.each do |note|
    shows_child_public_note(note['public'])
    shows_child_private_note(note['private'])
  end
end

Then /^(?:|I) see that his name is "([^\"]*)" "([^\"]*)"$/ do |first_name, last_name|
  shows_child_first_name_is(first_name)
  shows_child_last_name_is(last_name)
end

Then /^(?:|I) see that his birth date is "([^\"]*)"$/ do |birth_date|
  shows_child_was_born_on(birth_date)
end

Then /^(?:|I) see that he is allergic to "([^\"]*)"$/ do |allergies|
  shows_child_is_allergic_to(allergies)
end

Then /^(?:|I) see that he expects a bottle$/ do
  shows_child_takes_a_bottle
end

Then /^(?:|I) see that he does not expect a snack$/ do
  shows_child_takes_a_snack(:no)
end

Then /^(?:|I) see that he needs a nap$/ do
  shows_child_needs_a_nap
end