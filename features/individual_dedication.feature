Feature: Display Individual Dedication
  
  As a user
  I want an individual donors page
  So I can see all dedications made by a specific donor
  
  Background:
    Given the wall is set up
    Given the following hospitals exist
    | id | name       | surgeries  | cost  | status |
    | 1  | Hospital 1 | 10         | 20000 | true   |
    | 2  | Hospital 2 | 20         | 40000 | true   |
    
     And the following donors exist
    | id | first_name | last_name | email            | phone         | status |
    | 1  | John       | Smith     | jsmith@gmail.com | 123-456-7890  | true   |
    | 2  | John       | Williams  | jw123@yahoo.com  | 213-345-9824  | true   |
    | 3  | Tina       | Martinez  | tmart@gmail.com  | 253-726-9827  | true   |
    
    And the following dedications exist
    | id | tier     | dedication     | hospital_id | donor_id | status |
    | 1  | Platinum | For the kids   | 1           | 1        | true   |
    | 2  | Gold     | For the adults | 1           | 2        | true   |
    | 3  | Silver   | Go Sankara!    | 1           | 3        | false  |
     
    And I am on the individual dedication page for "John Smith" with dedication "1"
    
  Scenario: Seeing all information "John Smith" dedicates to "Hospital 1"
    Then I should see "John Smith"
    And I should see "Hospital 1"
    And I should see "Platinum"
    And I should see "For the kids"
    And I should not see "Hospital 2"
    And I should not see "Go Sankara!"
    And I should not see "For the adults" 


  Scenario: Seeing all social media links for "John Smith" dedication to "Hospital 1"
     And I should see the "Twitter" social media button
     And I should see the "Facebook" social media button
     And I should see the "Email" social media button
     
  Scenario: When I visit a hidden dedication I should see an error page
     Given I am on the individual dedication page for "Tina Martinez" with dedication "3"
     Then I should be on the errors page 

    