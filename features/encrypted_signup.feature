Feature:
  As a donor
  I want to be the only one who can sign up under my name 
  So I can be the only one who can edit my dedications
  
Background:
  Given the following donors exist
  | id | first_name | last_name | email           |
  | 1  | John       | Smith     | donor@donor.com |
   
Scenario: donor should be able to sign up through url with correct secret
    Given I sign up as donor 1 with the correct secret
    Then I should be on the donor page for "John Smith"
    
Scenario: donor should not be able to sign up through url with incorrect secret
    Given I sign up as donor 1 with an incorrect secret
    Then I should see "Invalid secret"
    And I should be on the sign up page