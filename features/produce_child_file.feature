Feature: Produce a single child file

  Background:
    Given a child registered with:
    |first name|last name|birth year|birth month|birth day|notes|
    |George|Orwell|2007|March|23|Frequently puts forks in electric plugs|

  Scenario: Produce a basic child file
    When I consult "George"'s file
    Then I see that his name is "George Orwell"
    And I see that his birth date is "23 March 2007"
    Then I see the following notes:
      |text|
      |Frequently puts forks in electric plugs|



