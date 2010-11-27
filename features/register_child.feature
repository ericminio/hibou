Feature: Register a child for a day

  Scenario: George registered for a day
    Given George Orwell is already registered at the kindergarden
    And the secretary registered George on 1 December 2010 for the morning
    And the secretary registered George on 1 December 2010 for the afternoon
    When I view all bookings
    Then George Orwell is on the schedule

  Scenario: Schedule for today
    Given George Orwell is already registered at the kindergarden
    And Bill Davis is already registered at the kindergarden
    And Roger Rabbit is already registered at the kindergarden
    And the secretary booked George Orwell for today in the morning
    And the secretary booked George Orwell for today in the afternoon
    And the secretary booked Bill Davis for today in the afternoon
    And the secretary booked Roger Rabbit for tomorrow in the afternoon

    When I view today's schedule

    Then George Orwell is on the AM schedule
    And George Orwell is on the PM schedule
    And Bill Davis is on the PM schedule
    And Roger Rabbit is not on either schedule