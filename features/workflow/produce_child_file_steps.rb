Given /^a child registered with:$/ do |information|
  When %{I go to the child registration page}
  When %{I register a child with:}, information
end

When /^I consult "([^"]*)" "([^"]*)"'s file$/ do |first_name, last_name|
  When %{I go to the children page}
  When %{I open #{first_name} #{last_name}'s file}
end
