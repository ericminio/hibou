Feature: Register a child for a day

  Scenario: George registered for a day
    Given George is already registered at the kindergarden
    And the secretary registers George on December 1st for the whole day
    When I view all bookings
    Then George is on the schedule
