Feature:
  As a donor
  I want to make an account
  So I can put my dedication on the Digital Wall of Founders
  
  Background:
    Given the following hospitals exist
    | id | name | surgeries  | cost  | status |
    | 1  | Hospital 1 | 10   | 20000 | true   |  
    | 2  | Hospital 3 | 50   | 50000 | true   |
    And the following donors exist
    | id | first_name | last_name  | email | phone | status | 
    | 1  | John | Smith | jsmith@gmail.com | 123-456-7890 | true | 
    And the following dedications exist
    | id | tier | dedication  | hospital_id | donor_id | status |
    | 1  | Platinum | For the kids | 1 | 1 | true |
    | 2  | Gold | For the adults   | 1 | 2 | true |
    | 3  | Silver | Go Sankara! | 1 | 3 | false |
    
Scenario: prefill form fields from link params
  Given I am on the sign up page
  Then I should see "John Smith"
  And I should see "jsmith@gmail.com"
  And I should see "123-456-7890"
  
Scenario: make new user account
  Given I am on the sign up page
  And I fill in "Password" with "password"
  And I press "Sign up"
  Then I should be on the donor page for "John Smith"
  Given I sign in with email "foo@foo.com" and password "password"
  And I am on the users page
  Then I should see "jsmith@gmail.com"