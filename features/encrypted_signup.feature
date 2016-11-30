Feature:
  As a donor
  I want to be the only one who can sign up under my name 
  So I can be the only one who can edit my dedications
  
Background:
  Given the following donors exist
  | id | name       | email           |  
  | 1  | John Smith | donor@donor.com |
   
 Scenario: manually inputting the url to sign up for a donor shouldn't work (url needs to contain secret)
    When I go to the signup page for donor 1
    Then I should be on the home page
  
 Scenario: donor should be able to sign up through encrypted url
    When I go to the encrypted signup page for donor 1
    Then I should see "Sign up"
    And I should see "Email"
    And I should see "donor@donor.com"
    And I should see "Password"