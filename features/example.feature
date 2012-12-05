Feature: Search for something on Google
  As a user,
  I want to be able to search on Google
  So I can find interesting things to read

  Scenario: Search Google for Cheese
    Given I visit Google Website
    When I search for the term "Cheese"
    Then I should see search results for Cheese
    And the results should include "Chedder"
