Feature:
  As a donor
  I want to be the only one who can sign up under my name 
  So I can be the only one who can edit my dedications
  
Background:
  Given the following donors exist
  | id | first_name | last_name | email           | 
  | 1  | John       | Smith     | donor@donor.com |
   
Scenario: donor should not be able to sign up through url with incorrect secret
    When I go to the secure signup page for donor 1 with secret "wrongsecret"
    And I press "Sign up"
    Then I should see "Invalid secret"