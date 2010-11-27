Feature: Registration and access control

  Scenario: valid credentials grant access
    Given I am on the registration page
    When I register as "vincent@gmail.com" with password "a secret"
    And I sign out
    And I go to the login page
    And I login as "vincent@gmail.com" using password "a secret"
    Then I see the home page