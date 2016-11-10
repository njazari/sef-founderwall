Feature: Review Dedications as Admin
  As an admin
  I want to review and approve submitted dedications
  So I can ensure they are appropriate for public display
  
  Background:
    Given the following hospitals exist
    | id | name | surgeries  | cost  | status |
    | 1  | Hospital 1 | 10   | 20000 | true   |  
    | 2  | Hospital 3 | 50   | 50000 | true   |
    And the following donors exist
    | id | first_name | last_name  | email | phone | status | 
    | 1  | John | Smith | jsmith@gmail.com | 123-456-7890 | true | 
    | 2  | John | Williams | jw123@yahoo.com  | 213-345-9824 | true | 
    | 3  | Tina | Martinez | tmart@gmail.com | 253-726-9827 | true |
    And the following dedications exist
    | id | tier | dedication  | hospital_id | donor_id | status | approved |
    | 1  | Platinum | For the kids | 1 | 1 | true | false |
    | 2  | Gold | Inappropriate stuff | 1 | 2 | true | false |
    | 3  | Silver | | 1 | 3 | false | false |
    And the following users exist
    | id | email         | password | admin |
    | 1  | foo@foo.com   | password | true  |
    | 2  | bar@bar.com   | password | false | 
    
Scenario:  when submitting a dedication for review, it should not show up on the wall immediately
    Given I sign in with email "bar@bar.com" and password "password"
    And I am on the donor page for "Tina Martinez"
    And I follow "Write a Dedication"
    And I should be on the edit page for dedication 3
    Given I fill in "Dedication" with "Go Sankara"
    And I press "Submit"
    And I go to the hospital page for "Hospital 1"
    Then I should not see "For the kids"
    Given I sign in with email "foo@foo.com" and password "password"
    And I am on the pending dedications page
    Then I should see "For the kids"
    
Scenario: approve a dedication
    Given I sign in with email "foo@foo.com" and password "password"
    Then I go to the pending dedications page
    Then I press "approve_1"
    Then I should not see "For the kids"
    Then I go to the hospital page for "Hospital 1"
    And I should see "For the kids"
    Then I should go to the approved dedications page
    And I should see "For the kids"
  
Scenario: reject a dedication
    Given I sign in with email "foo@foo.com" and password "password"
    Then I go to the pending dedications page
    Then I press "reject_2"
    Then I should not see "Inappropriate stuff"
    Then I go to the hospital page for "Hospital 1"
    And I should not see "Inappropriate stuff"
    Then I should go to the approved dedications page
    And I should not see "For the kids"