When /^(?:|I) register a child with:$/ do |information|
  child = information.rows_hash
  with_scope('#new_child') do
    fill_in 'child_first_name', :with => child['first name']
    fill_in 'child_last_name', :with => child['last name']
    select_birth_date(Date.parse(child['birth date']))
    check 'child_bottle' if child['bottle'] == "yes"
    check 'child_snack' if child['snack'] == "yes"
    check 'child_nap' if child['nap'] == "yes"
    fill_in 'child_allergies', :with => child['allergies']
    fill_in 'child_public_notes', :with => child['public notes']
    fill_in 'child_private_notes', :with => child['private notes']
    # todo use id selector instead of link text
    click_button I18n.t(:save)
  end
end

def select_birth_date(date)
  select date.year.to_s, :from => 'child_birth_date_1i'
  select I18n.l(date, :format => "%B"), :from => 'child_birth_date_2i'
  select date.day.to_s, :from => 'child_birth_date_3i'
end