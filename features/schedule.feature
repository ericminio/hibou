Feature: Consulting the schedule for a given day

 Background: Children are registered
   Given these children are registered
     |first name|last name|
     |George    |Orwell   |
     |Bill      |Davis    |
     |Roger     |Rabbit   |

 Scenario: Opening today's schedule
   Given the following bookings
     |name  |date      |period|
     |George|2010-12-01|am    |
     |George|2010-12-01|pm    |
     |Bill  |2010-12-01|am    |
     |Roger |2010-12-02|am    |
   And today is 2010-12-01

   When I consult today's schedule

   Then the am schedule is
     |name         |
     |George Orwell|
     |Bill Davis   |
   And the pm schedule is
     |name         |
     |George Orwell|