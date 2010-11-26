Feature: Register a child for a day

  Scenario: George registered for a day
    Given George is already registered at the kindergarden
    When the secretary registers George for December 1st
    Then George is on the December 1st schedule