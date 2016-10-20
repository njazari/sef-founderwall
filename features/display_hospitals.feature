Feature: Display Main Hospital List
  
  As a user
  I want to see all the hospitals
  So that I can see all the ongoing projects
  
  Background:
    Given the wall is set up
    Given the following hospitals exist
    | name        | 
    | Hospital 1  | 
    | Hospital 2  |
    | Hospital 3  |
    | Hospital 4  | 
    | Hospital 5  |
    | Hospital 6  |
    | Hospital 7  | 
    | Hospital 8  |
    | Hospital 9  |
    | Hospital 10 | 

  Scenario: Create hospital list page shown
    Given I am on the home page
    Then I should see "Wall of Founders"
    And I should see "Search"
    
  Scenario: All hospitals shown
    Given I am on the home page
    Then I should see "Hospital 1"
    And I should see "Hospital 2"
    And I should see "Hospital 10"
    And I should not see "Hospital 0"
  
  Scenario: All hospitals shown in alphabeltical order
    Given I am on the home page
    Then I should see "Hospital 1" before "Hospital 2"
    