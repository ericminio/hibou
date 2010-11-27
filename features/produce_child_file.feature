Feature: Produce a single child file

  Background:
    Given a child registered with:
    |first name|last name|birth year|birth month|birth day|snack|bottle|nap|allergies|public notes|private notes|
    |George|Orwell|2007|March|23|no|yes|yes|peanuts|Frequently puts forks in electric plugs|Father can't approach|

  Scenario: Produce a basic child file
    When I consult "George"'s file
    Then I see that his name is "George Orwell"
    And I see that his birth date is "23 March 2007"
    And I see that he does not expect a snack
    And I see that he expects a bottle
    And I see that he needs a nap
    And I see that he is allergic to "peanuts"
    And I see the following notes:
      |public|private|
      |Frequently puts forks in electric plugs|Father can't approach|



