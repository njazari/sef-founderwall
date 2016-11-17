Feature:
  As Sankara Eye Foundation
  I want to prevent donors from editing their dedications once they've published them
  So we can keep the Digital Wall and the physical Walls in hospitals symmetric
  
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
  
Scenario: Once the donor publishes they should no longer see an Edit button on their donor page
  Given I press "Publish"
  Then I should not see "Edit"
  
Scenario: Once the donor publishes they should no longer see an Edit button on the dedication page
  Given I press "Publish"
  And I go to the dedication page for dedication 1
  Then I should not see "Edit"
  
Scenario: Once the donor publishe 