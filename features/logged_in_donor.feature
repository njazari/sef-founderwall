Feature:
  As a donor
  I want to be able to see my unpublished dedications iff I am logged in
  So I and no one else can edit them
  
  Background:
    Given the following users exist
        | email           | password | admin | donor_id |
        | donor@donor.com | password | false | 41       |
        | not@donor.com   | password | false | 40       |
    And the following hospitals exist
        | id  | name |
        | 221 | B    |
    And the following donors exist
        | id  | first_name | last_name  | email           | 
        | 40  | Sherlock   | Holmes     | not@donor.com   | 
        | 41  | John       | Watson     | donor@donor.com | 
    And the following dedications exist
        | id | hospital_id | tier | dedication    | donor_id | status | published |
        | 1  | 221         | Gold | To Mary       | 41       | true   | true      |
        | 2  | 221         | Gold | To Sherlock   | 41       | true   | false     |
 
 Scenario: I should be able to see only published dedications if I am not logged in
  Given I am on the donor page for "John Watson"
  Then I should see "Published Dedications"
  And I should see "To Mary"
  And I should not see "Unpublished Dedications"
  And I should not see "To Sherlock"
  
Scenario: I should be able to see my unpublished dedications if I am logged in
  Given I sign in with email "donor@donor.com" and password "password"
  And I go to the donor page for "John Watson"
  Then I should see "Published Dedications"
  And I should see "To Mary"
  And I should see "Unpublished Dedications"
  And I should see "To Sherlock"
  
Scenario: I should be able to see only published dedications if I am logged in as a different user
  Given I sign in with email "not@donor.com" and password "password"
  And I go to the donor page for "John Watson"
  Then I should see "Published Dedications"
  And I should see "To Mary"
  And I should not see "Unpublished Dedications"
  And I should not see "To Sherlock" 
  
Scenario: I should not see an edit button on a dedication page if I am not logged in as the donor
  Given I sign in with email "not@donor.com" and password "password"
  And I go to the dedication page for dedication 1
  Then I should not see "Edit"
  
 Scenario: I should see an edit button on a dedication page if I am logged in as the donor and the dedication is not published
  Given I sign in with email "donor@donor.com" and password "password"
  And I go to the dedication page for dedication 2
  Then I should see "Edit"