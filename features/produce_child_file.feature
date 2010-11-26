Feature: Produce a single child file

  Scenario: Produce a basic child file
    Given a child registered with first name "George" and last name "Orwell" and the following notes:
      """
      Frequently puts forks in electric plugs
      Likes to hide in closet; check before leaving at night
      """
    When I consult "George"'s file

    Then I see "George" as the first name
    And I see "Orwell" as the last name
    And I see the following notes:
      |text|
      |Frequently puts forks in electric plugs|
      |Likes to hide in closet; check before leaving at night|
