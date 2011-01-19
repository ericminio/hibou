Feature: Cancelling a booking

 Background: Children are registered
   Given these children are registered
     |first name|last name|
     |George    |Orwell   |
     |Bill      |Davis    |
     |Roger     |Rabbit   |

 Scenario: Cancelling a child for today
   Given the following bookings
     |name  |date      |period|
     |George|2010-12-01|am    |
     |George|2010-12-01|pm    |
     |Bill  |2010-12-01|am    |
     |Roger |2010-12-04|am    |
   And today is 2010-12-01

   When I cancel the booking of Bill Davis for 2010-12-01 AM
   And I consult today's schedule

   Then the am schedule is
     |name         |
     |George Orwell|
   And the pm schedule is
     |name         |
     |George Orwell|

  Scenario: Cancelling a child for today pm
   Given the following bookings
     |name  |date      |period|
     |George|2010-12-01|am    |
     |George|2010-12-01|pm    |
     |Bill  |2010-12-01|am    |
     |Bill  |2010-12-01|pm    |
   And today is 2010-12-01

   When I cancel the booking of George Orwell for 2010-12-01 PM
   And I consult today's schedule

   Then the am schedule is
     |name         |
     |George Orwell|
     |Bill Davis   |
   And the pm schedule is
     |name         |
     |Bill Davis   |