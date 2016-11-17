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
        | hospital_id | tier | dedication    | donor_id | status | published |
        | 221         | Gold | To Mary       | 41       | true   | true      |
        | 221         | Gold | To Sherlock   | 41       | true   | false     |
 
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
  