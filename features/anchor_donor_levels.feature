As a user, 
I want to see anchor links on the hospital page, 
So that I don't have to scroll down to find them

Background:
  Given the following hospitals exist
    | id | name | surgeries  | cost |
    | 1  | Hospital 1 | 10 | 20000 |
    And the following donors exist
    | id | first_name | last_name  | email | phone |
    | 1  | John | Smith | jsmith@gmail.com | 123-456-7890 |
    | 2  | John | Williams | jw123@yahoo.com  | 213-345-9824 | 
    | 3  | Tina | Martinez | tmart@gmail.com | 253-726-9827 |
    And the following dedications exist
    | id | tier | dedication  | hospital_id | donor_id | status |
    | 1  | Platinum | For the kids | 1 | 1 | true |
    | 2  | Gold | For the adults   | 1 | 2 | true |
    | 3  | Silver | Go Sankara! | 1 | 3 | false |
    
Scenario: When on a hospital page, I should see links to jump down to a donor level
    Given I am on the hospital page for "Hospital 1" 
    Then I should see "Silver"
    And I follow "Silver"
    Then I should be on the hospital page for "Hospital 1"
    Then I should see "Platinum"
    And I follow "Platinum"
    Then I should be on the hospital page for "Hospital 1"
    Then I should see "Gold"
    And I follow "Gold"
    Then I should be on the hospital page for "Hospital 1"
  