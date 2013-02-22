Feature: Account Personalization
  Users need to set up their account

  Background:

  Scenario: A new user wants to configure their account so they get appropriate meal plans
    Given I have signed up for a new account
    When I complete the sign up process
    And I am taken to a "Preferences" page
    Then I can set the number of humans in my household
    And for each human I can select a size
    And for each human I can select dietary restrictions
    And I can save my settings

  Scenario: A current user needs to change their account settings because a member of their household has fallen to the zombie hordes
    Given I have an account
    When I sign in
    Then I can go to my "Preferences" page
    And I can change the number of humans in my household
    And for each human I can change the size
    And for each human I can change the dietary restrictions
    And I can save my settings
