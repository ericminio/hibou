require 'machinist/active_record'

 Child.blueprint do
   first_name { Faker::Name.first_name }
   last_name  { Faker::Name.last_name }
   birth_date { Date.today.years_ago(1) }
 end
