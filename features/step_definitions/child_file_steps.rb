Given /^that "([^"]*)" is registered with the following information:$/ do |child,table|
  visit 'http://google.ca'
end

When /^I consult "([^"]*)"'s file$/ do |child|
  pending # express the regexp above with the code you wish you had
end

Then /^I see "([^"]*)" as the first name$/ do |first_name|
  pending # express the regexp above with the code you wish you had
end

Then /^"([^"]*)" as the last name$/ do |last_name|
  pending # express the regexp above with the code you wish you had
end