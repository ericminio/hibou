Feature: consulting the bookings for a day

 Background: children are registered
   Given these children are registered
     |first name|last name|
     |George|Orwell|
     |Bill|Davis|
     |Roger|Rabbit|

 Scenario: Schedule for a day
   Given the following bookings
     |name|date|period|
     |George|2010-12-01|am|
     |George|2010-12-01|pm|
     |Bill|2010-12-01|am|
     |Roger|2010-12-02|am|

   When I consult the bookings for 2010-12-01

   Then the am schedule contains
     |name|
     |George Orwell|
     |Bill Davis|
   And the pm schedule contains
     |name|
     |George Orwell|