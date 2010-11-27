Feature: Register a child for a day

  Scenario: George registered for a day
    Given George Orwell is already registered at the kindergarden
    And the secretary registered George on December 1st for the morning
    And the secretary registered George on December 1st for the afternoon
    When I view all bookings
    Then George Orwell is on the schedule

  Scenario: Schedule for today
    Given George Orwell is already registered at the kindergarden
    And Bill Davis is already registered at the kindergarden
    And Roger Rabbit is already registered at the kindergarden
    And the secretary registered George Orwell on today for the morning
    And the secretary registered George Orwell on today for the afternoon
    And the secretary registered Bill Davis on today for the afternoon
    And the secretary registered Roger Rabbit on tomorrow for the afternoon

    When I view today's schedule

    Then George Orwell is on the AM schedule
    And George Orwell is on the PM schedule
    And Bill Davis is on the PM schedule
    And Roger Rabbit is not on either schedule