Feature: Signing in
  
  Scenario: Unsuccesful signin
    Given a user visits the signin page
      And the user has an account
    When he submits invalid signin information
    Then he should see an error message
      And he should see a signout link
