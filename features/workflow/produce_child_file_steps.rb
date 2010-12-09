Given /^a child registered with:$/ do |information|
  When %{I go to the child registration page}
  When %{I register a child with:}, information
end

When /^I consult "([^"]*)"'s file$/ do |child_name|
  When %{I go to the children page}
  When %{I open #{child_name}'s file}
end
