Feature: As a donor, 
    I want to give consent and submit my dedication, 
    so that I can be on the Wall of Founders

Background:
  And the following donors exist
    | id | first_name | last_name  | email | phone |
    | 1  | John | Smith | jsmith@gmail.com | 123-456-7890 |
  And I am on the submit dedication page
  And my donor id is 1

Scenario: After making a donation, I should see a form to enter my dedication and submit my consent
  Then I should see "My Dedication"
  And I should see "Give Consent"

Scenario: After submitting dedication and consent, I should see the dedication on the hospital page
  When I fill in "My Dedication" with "Goodbye blindness!"
  And I check "Give Consent"
  And I press "Submit"
  Then I should see "Thank you for submitting your dedication"
  And I should be on the hospital page for "Hospital 1"
  And I should see "Goodbye blindness!"
  
Scenario: After submitting dedication and consent, I should see my dedication on my donor page 
  When I fill in "My Dedication" with "Goodbye blindness!"
  And I check "Give Consent"
  And I press "Submit"
  And I go to the donor page for "John Smith"
  Then I should see "Goodbye blindness!"