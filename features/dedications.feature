Feature: List of Dedications
    As a user
    I want to see donors for a hospital
    So that I can see who contributed to a project
  
  Background:
    Given the following hospitals exist
    | id | name | surgeries  | cost | status |
    | 1  | Hospital 1 | 10 | 20000 | true |
    And the following donors exist
    | id | first_name | last_name  | email | phone | status |
    | 1  | John | Smith | jsmith@gmail.com | 123-456-7890 | true |
    | 2  | John | Williams | jw123@yahoo.com  | 213-345-9824 |true |
    | 3  | Tina | Martinez | tmart@gmail.com | 253-726-9827 | true |
    And the following dedications exist
    | id | tier | dedication  | hospital_id | donor_id | status |
    | 1  | Platinum | For the kids | 1 | 1 | true |
    | 2  | Gold | For the adults   | 1 | 2 | true |
    | 3  | Silver | Go Sankara! | 1 | 3 | false |
    And I am on the hospital page for "Hospital 1" 

  Scenario: When on a Hospital page, I should see the names of all donors and their dedications
    Then I should see "John Smith"
    And I should see "For the kids"
    And I should see "John Williams"
    And I should see "For the adults"
    And I should not see "Tina Martinez"
    And I should not see "Go Sankara!"
    
  Scenario: When on a hospital page, I should see the hospital's details
    Then I should see "Surgeries: 10"
    And I should see "Cost: 20000"
    
  Scenario: When I click on a dedication I should be taken to the dedication's page
    And I click on "See Dedication"
    Then I should be on the dedication page for dedication 1
    
  Scenario: When I click on a donor I should be taken to the donor's page
    And I follow "John Smith"
    Then I should be on the donor page for "John Smith"