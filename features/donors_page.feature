Feature: List of Dedications for a Donor
    As a user
    I want an individual donors page
    So I can see all dedications made by a specific donor
  
  Background:
    Given the following hospitals exist
    | id | name | surgeries  | cost | status |
    | 1  | Hospital 1 | 10 | 20000 | true |
    | 2  | Hospital 2 | 50 | 100000 | true |
    And the following donors exist
    | id | first_name | last_name  | email | phone | status |
    | 1  | John | Smith | jsmith@gmail.com | 123-456-7890 | true |
    | 2  | John | Williams | jw123@yahoo.com  | 213-345-9824 | true |
    | 3  | Tina | Martinez | tmart@gmail.com | 253-726-9827 | false |
    And the following dedications exist
    | id | tier | dedication  | hospital_id | donor_id | status | published |
    | 1  | Platinum | For the kids | 1 | 1 | true | true |
    | 2  | Gold | For the adults   | 2 | 1 | true | true |
    | 3  | Silver | Go Sankara! | 1 | 3 | true | true |
    And I am on the donor page for "John Smith"

  Scenario: When on a donor page, I should see the names of all donor's dedications
    Then I should see "John Smith"
    And I should see "For the kids"
    And I should see "For the adults"
    And I should see "Platinum"
    And I should see "Gold"
    And I should not see "Go Sankara!"
    
  Scenario: When I click on a hospital page, I should be taken to that hospital's page
    And I follow "Hospital 1"
    Then I should be on the hospital page for "Hospital 1"
    
  Scenario: When I click on a dedication page, I should be taken to that dedication's page
    And I follow "view_2"
    Then I should be on the dedication page for dedication 2
    
  Scenario: When I visit a hidden donor I should see an error page
    Given I am on the donor page for "Tina Martinez" 
    Then I should be on the errors page 
    
    