Feature: User settings page

  Background:
    Given a user has an account
    Given a user is signed in

  Scenario: Signed in user on profile settings page
    When he visits the profile settings page
    Then he should see an update form

  Scenario: Invalid edit
    When the information he edits is invalid
    Then he should stay on the profile settings page

  Scenario: Valid edit
    When the information he edits is valid
    Then he should be redirect to his updated profile

