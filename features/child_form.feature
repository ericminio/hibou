Feature: Produce a single child file
  Scenario: Produce a basic child file
    Given that "George" is registered with the following information:
      |first name|last name|
      |George|Orwell|

    When I consult "George"'s file

    Then I see "George" as the first name
    And "Orwell" as the last name