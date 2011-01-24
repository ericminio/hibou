Feature: Managing bookings

  Background: Children are registered
    Given these children are registered
      | first name | last name |
      | George     | Orwell    |
      | Bill       | Davis     |
      | Roger      | Rabbit    |

  Scenario: Staff cancels a booking and no longer sees the booking on the schedule
    Given the following bookings
      | name   | date       | period |
      | George | 2010-12-01 | am     |
      | George | 2010-12-01 | pm     |
      | Bill   | 2010-12-01 | am     |
    And today is 2010-12-01

    When I cancel the booking of Bill Davis for 2010-12-01 AM

    Then today's am schedule is
      | name          |
      | George Orwell |
    And today's pm schedule is
      | name          |
      | George Orwell |