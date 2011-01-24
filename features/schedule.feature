Feature: Consulting the schedule

 Background: Children are registered
   Given these children are registered
     |first name|last name|
     |George    |Orwell   |
     |Bill      |Davis    |
     |Roger     |Rabbit   |

 Scenario: Staff consults the schedule of the next few days and sees the existing bookings
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
   And today's pm schedule is
     |name         |
     |George Orwell|

  #todo Scenario: Staff consults the schedule and sees there is no booking