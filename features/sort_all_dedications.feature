Feature: Display Individual Dedication
  
  As a user
  I want to see a list of all dedications
  So I can see what causes people are donating to
  
  Background:
    Given the wall is set up
    Given the following hospitals exist
    | id | name       | surgeries  | cost  | status |
    | 1  | Hospital 1 | 10         | 20000 | true   |
    | 2  | Hospital 2 | 20         | 40000 | true   |
    | 3  | Hospital 3 | 20         | 40000 | true   |
    
     And the following donors exist
    | id | first_name | last_name | email            | phone         | status |
    | 1  | John       | Smith     | jsmith@gmail.com | 123-456-7890  | true   |
    | 2  | John       | Williams  | jw123@yahoo.com  | 213-345-9824  | true   |
    | 3  | Tina       | Martinez  | tmart@gmail.com  | 253-726-9827  | true   |
    
    And the following dedications exist
    | id | tier     | dedication     | hospital_id | donor_id | status | published | date     |
    | 1  | Platinum | For the kids   | 1           | 1        | true   | true      | 03082015 |
    | 2  | Gold     | For the adults | 1           | 2        | true   | true      | 04022014 |
    | 3  | Silver   | Go Sankara!    | 1           | 3        | true  | true      | 10102013 |
     
    And I am on the individual dedication page for "John Smith" with dedication "1"
    
  Scenario: Sort dedications in alphabetical order
    Given I am on the all dedications page
    When I slect "Dedication" from "filterrific_sorted_by"
    Then I should see "For the kids" before "For the adults"
    And I should see "For the kids" before "Go Sankara!"

  Scenario: Sort dedications by donor names
    Given I am on the all dedications page
    When I slect "Donor" from "filterrific_sorted_by"
    Then I should see "John Smith" before "John Williams"
    And I should see "John Smith" before "Tina Martinez"
    And I should see "John Williams" before "Tina Martinez"
