Feature: Tracking progress towards having 400 bookings per year

  Background: Children are registered
    Given a child registered with:
      | first name    | George    |
      | last name     | Orwell    |
      | birth date    | 2007-03-23|


  Scenario: Staff notices that score is zero when there is no booking
    Given no child was booked yet
    When Marina looks at the scoreboard
    Then Marina notices that the score is 0

  Scenario: Staff books a child and sees the score increased by 1
    Given the following bookings
      | name   | date       | period |
      | George | 2010-12-01 | am     |
      | George | 2010-12-01 | pm     |
    When Marina looks at the scoreboard
    Then Marina notices that the score is 2

    When Marina books George for 2010-12-23 am
    And Marina looks at the scoreboard
    Then Marina notices that the score is 3

