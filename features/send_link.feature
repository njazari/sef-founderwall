Feature:
  As an admin
  I want to send a unique sign up link
  So that a donor can make an account and/or submit their dedication
  
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
    And the following users exist
    | id | email         | password | admin |
    | 1  | foo@foo.com   | password | true  |
    | 2  | bar@bar.com   | password | false | 

Scenario: make a new link from a user
  Given I sign in with email "foo@foo.com" and password "password"
  Given I am on the admin page
  And I follow "Donors"
  And I check "bulk_ids_1"
  Then I press "Generate Link(s)"
  Then I should see "Generated Link:"