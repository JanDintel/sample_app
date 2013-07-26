Feature: User settings page

  Scenario: Authorized to edit settings
    Given a user is authorized to edit settings
    When he visits his settings page
    Then he should see an update form

  Scenario: Invalid edit
    Given a user edits his information
    When the information he edits is invalid
    Then he should stay on the profile settings page

  Scenario: Valid edit
    Given a user edits his information
    When the information he edits is valid
    Then he should be redirect to his updated profile

