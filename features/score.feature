Feature: Tracking progress towards having 400 bookings per year

  Scenario: Staff notices that score is zero when there is no booking
    Given no child was booked yet
    When Marina looks at the scoreboard
    Then Marina notices that the score is 0

#  Scenario: Staff books a child and sees the score increased by 1

