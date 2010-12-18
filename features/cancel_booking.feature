Feature: Cancelling a booking

 Background: Children are registered
   Given these children are registered
     |first name|last name|
     |George    |Orwell   |
     |Bill      |Davis    |
     |Roger     |Rabbit   |

 Scenario: Cancelling a booking for today
   Given the following bookings
     |name  |date      |period|
     |George|2010-12-01|am    |
     |George|2010-12-01|pm    |
     |Bill  |2010-12-01|am    |
     |Roger |2010-12-02|am    |
   And today is 2010-12-01

   When I cancel the booking of Bill Davis for 2010-12-01 am
   And I consult today's schedule

   Then the am schedules are
     |name         |
     |George Orwell|
   And the pm schedules are
     |name         |
     |George Orwell|