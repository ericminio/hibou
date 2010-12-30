Then /^(?:|I) see the following notes:$/ do |notes|
  notes.hashes.each do |note|
    page.should have_content(note['public'])
    page.should have_content(note['private'])
  end
end

Then /^(?:|I) see that his first name is "([^\"]*)"$/ do |first_name|
  with_scope('#first_name') do
    page.should have_content(first_name)
  end
end

Then /^(?:|I) see that his last name is "([^\"]*)"$/ do |last_name|
  with_scope('#last_name') do
    page.should have_content(last_name)
  end
end

Then /^(?:|I) see that his birth date is "([^\"]*)"$/ do |birth_date|
  with_scope('#birth_date') do
    page.should have_content(I18n.l(Date.parse(birth_date), :format => :medium))
  end
end

Then /^(?:|I) see that he is allergic to "([^\"]*)"$/ do |allergies|
  with_scope('#allergies') do
    page.should have_content(allergies)
  end
end

Then /^(?:|I) see that he expects a bottle$/ do
  with_scope('#bottle') do
    page.should have_content(I18n.t(:yes))
  end
end

Then /^(?:|I) see that he does not expect a snack$/ do
  with_scope('#snack') do
    page.should have_content(I18n.t(:no))
  end
end

Then /^(?:|I) see that he needs a nap$/ do
  with_scope('#nap') do
    page.should have_content(I18n.t(:yes))
  end
end

Then /^(?:|I) see that George Orwell booking will be paid with Cash$/ do
  page.should have_content('Cash')
end