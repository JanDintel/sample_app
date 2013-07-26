Feature: Authentication
  
  Background:
    Given a user has an account is in not signed in

  Scenario: Unsuccesful signin
    Given a user visits the signin page
    When he submits invalid signin information
    Then he should see an authentication error message

  Scenario: Successful signin
    Given a user visits the signin page
    When the user submits valid signin information
    Then he should see his profile page
      And he should see a signout link
      And he should see a profile settings link

  Scenario: Visits profile settings page
    When he visits the profile settings page
    Then he should be redirected to the log in page
