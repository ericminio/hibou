Then /^(?:|I) see the following notes:$/ do |notes|
  notes.hashes.each do |note|
    page.should have_content(note['public'])
    page.should have_content(note['private'])
  end
end

Then /^(?:|I) see that his name is "([^\"]*)"$/ do |name|
  page.should have_content(name)
end

Then /^(?:|I) see that his birth date is "([^\"]*)"$/ do |birth_date|
  page.should have_content(I18n.l(Date.parse(birth_date), :format => :medium))
end

Then /^(?:|I) see that he is allergic to "([^\"]*)"$/ do |allergies|
  page.should have_content(allergies)
end

Then /^(?:|I) see that he expects a bottle$/ do
  with_scope('#child-bottle-yes') do
    page.should have_content('X')
  end
end

Then /^(?:|I) see that he does not expect a snack$/ do
  with_scope('#child-snack-no') do
    page.should have_content('X')
  end
end

Then /^(?:|I) see that he needs a nap$/ do
  with_scope('#child-nap-yes') do
    page.should have_content('X')
  end
end

Then /^(?:|I) see that George Orwell booking will be paid with Cash$/ do
  page.should have_content('Cash')
end