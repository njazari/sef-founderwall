Feature: Syling the pages
  
  As a user
  So I have a pleasurable viewing experience
  I want a nice UI
  
  Background:
    Given the wall is set up
    Given the following hospitals exist
    | id | name       | surgeries  | cost  |
    | 1  | Hospital 1 | 10         | 20000 |
    | 2  | Hospital 2 | 20         | 40000 |
    
     And the following donors exist
    | id | first_name | last_name | email            | phone         |
    | 1  | John       | Smith     | jsmith@gmail.com | 123-456-7890  |
    | 2  | John       | Williams  | jw123@yahoo.com  | 213-345-9824  | 
    | 3  | Tina       | Martinez  | tmart@gmail.com  | 253-726-9827  |
    
    And the following dedications exist
    | id | tier     | dedication     | hospital_id | donor_id | status |
    | 1  | Platinum | For the kids   | 1           | 1        | true   |
    | 2  | Gold     | For the adults | 1           | 2        | true   |
    | 3  | Silver   | Go Sankara!    | 1           | 3        | false  |
     
    
  Scenario: Main Wall of Founders page should be stylish
    Given I am on the home page
    Then I should see "Wall of Founders" is centered
    Then I should see "Wall of Founders" is orange
    Then I should see "Wall of Founders" has size equal 26px
  
    
  Scenario: Individual Hospital page should be stylish
    Given I am on the hospital page for "Hospital 1"
    Then I should see "Hospital 1" is centered
    Then I should see "Hospital 1" is blue
    Then I should see "Hospital 1" has size equal 20px
  