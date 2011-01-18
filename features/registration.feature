#todo Should probably be unit tests
Feature: Access control

  Scenario: valid credentials grant access
    Given I am registered as "vincent@gmail.com" with password "a secret"
    And I am not authenticated
    When I login as "vincent@gmail.com" using password "a secret"
    Then I can access the site

  Scenario: access to the user creation page is blocked
    Given I am not authenticated
    When I try to register
    Then I see a warning telling me the page is inaccessible