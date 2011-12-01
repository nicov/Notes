Feature: Notes managment
  As a user
  I want to manage notes
  
  Scenario: When I destroy a note, I am redirected to its categorie page
    Given I'm logged in
    And the categorie "various"
    And the note "note1" with content "This is a note" and categorie "various"
    And the note "note2" with content "This is a note" and categorie "various"
    When I go to the home page
    When I follow "various (2)"
    And I follow "Supprimer"
    Then I should be on the "various" categorie page
