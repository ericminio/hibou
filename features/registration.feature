Feature: Access control

  Scenario: valid credentials grant access
    Given I am registered as "vincent@gmail.com" with password "a secret"
    And I am signed out
    When I go to the login page
    And I login as "vincent@gmail.com" using password "a secret"
    Then I see the home page

  Scenario: access to the user creation page is blocked
    Given I am signed out
    When I go to the registration page
    Then I see a warning telling me the page is inaccessible