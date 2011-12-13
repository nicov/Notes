Feature: Notes search
  As a user
  I want to search notes
  So that I find them according to keywords
  
  Scenario: I search by its title
    Given the user "user1" with password "password"
    And the note "note1" with content "This is a note"
    And the note "memo1" with content "This is a memo"
    When I go to the home page
    And I should see "note1"
    And I should see "memo1"
    When I fill in "search" with "memo"
    And I press "Search"
    Then I should see "memo1"
    And I should not see "note1"
