require 'machinist/active_record'

 Child.blueprint do
   first_name { Faker::Name.first_name }
   last_name  { Faker::Name.last_name }
   birth_date { Date.today.years_ago(1) }
 end

Booking.blueprint do
  child { Child.make }
  date { Date.tomorrow }
  payment_method { %w{Cash Cheque Sipple DP CISC Fond\ Social Autre}.rand }
  period { %w{AM PM}.rand }
end


