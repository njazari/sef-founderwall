Feature: Display Main Hospital List
  
  As a user
  I want to see all the hospitals
  So that I can see all the ongoing projects
  
  Background:
    Given the wall is set up
    Given the following hospitals exist
    | name        | city        | state | building_status   | status | 
    | Hospital 1  | Los Angeles | CA    | In Construction   | true   |
    | Hospital 2  | Berkeley    | CA    | Completed         | true   |
    | Hospital 3  | Seattle     | WA    | Completed         | false   |


  Scenario: Create hospital list page shown
    Given I am on the home page
    Then I should see "Wall of Founders"
    And I should see "Log In"
    And I should see "Dedications"
    
  Scenario: All hospitals shown
    Given I am on the home page
    Then I should see "Hospital 1"
    Then I should see "Hospital 1" before "Los Angeles"
    And I should not see "Hospital 2" before "Los Angeles"
    Then I should see "Hospital 1" before "In Construction" 
    And I should not see "Hospital 2" before "In Construction"
    And I should see "Hospital 2"
    And I should not see "Hospital 0"
  
  Scenario: All hospitals shown in alphabeltical order
    Given I am on the home page
    Then I should see "Hospital 1" before "Hospital 2"
    
  Scenario: When I visit a hidden hospital I should see an error page
    Given I am on the hospital page for "Hospital 3" 
    Then I should be on the errors page 