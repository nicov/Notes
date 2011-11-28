Feature: Login
  As a user
  I want to log in
  So that I have privileged acces
  
  Scenario: I try to edit a note and login
    Given the user "user1" with password "password"
    And the note "note1" with content "This is a note"
    When I want to edit the note "note1"
    Then I should see "Sign in"
    When I fill in "Username" with "user1"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should be on edit page of note "note1"
