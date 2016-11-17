Feature: As a donor, 
    I want to give consent and submit my dedication, 
    so that I can be on the Wall of Founders

Background:    
  Given the following hospitals exist
    | id | name       | status |
    | 1  | Hospital 1 | true   |
  And the following donors exist
    | id | first_name | last_name  | email | phone | status |
    | 1  | John | Smith | jsmith@gmail.com | 123-456-7890 | true |
  And the following dedications exist
    | id | tier     | dedication     | hospital_id | donor_id | status | published |
    | 1  | Platinum | For the kids   | 1           | 1        | true   | false     |
  And the following users exist
    | id | email            | password | donor_id |
    | 1  | jsmith@gmail.com | password | 1 |
  And I sign in with email "jsmith@gmail.com" and password "password"
  And I am on the edit page for dedication 1

Scenario: After making a donation, I should see a form to enter my dedication and submit my consent
  Then I should see "Write a dedication for your donation"
  And I should see "I want my dedication to appear on the Digital Wall of Founders"

Scenario: After publishing dedication and consent, I should see the dedication on the hospital page
  When I fill in "dedication" with "Goodbye blindness!"
  And I check "I want my dedication to appear on the Digital Wall of Founders"
  And I press "Publish"
  Then I should be on the donor page for "John Smith"
  And I should see "Goodbye blindness!"
  And I should not see "For the kids"
  
Scenario: After publishing dedication and consent, I should see my dedication on my donor page 
  When I fill in "dedication" with "Goodbye blindness!"
  And I check "I want my dedication to appear on the Digital Wall of Founders"
  And I press "Publish"
  Then I should see "Goodbye blindness!"
  
Scenario: After revoking consent, I should not see my dedication on the Digital Wall of Founders
  When I uncheck "I want my dedication to appear on the Digital Wall of Founders"
  And I press "Publish"
  And I go to the hospital page for "Hospital 1"
  Then I should not see "For the kids"