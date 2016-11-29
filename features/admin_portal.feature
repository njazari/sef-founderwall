Feature: Admin portal
    As an admin
    I want an admin portal
    So that I can edit data
  
  Background:
    Given the following hospitals exist
    | id | name | surgeries  | cost  | status |
    | 1  | Hospital 1 | 10   | 20000 | true   |  
    | 2  | Hospital 3 | 50   | 50000 | true   |
    And the following donors exist
    | id | first_name | last_name  | email | phone | status | 
    | 1  | John | Smith | jsmith@gmail.com | 123-456-7890 | true | 
    | 2  | John | Williams | jw123@yahoo.com  | 213-345-9824 | true | 
    | 3  | Tina | Martinez | tmart@gmail.com | 253-726-9827 | true |
    And the following dedications exist
    | id | tier | dedication  | hospital_id | donor_id | status |
    | 1  | Platinum | For the kids | 1 | 1 | true |
    | 2  | Gold | For the adults   | 1 | 2 | true |
    | 3  | Silver | Go Sankara! | 1 | 3 | false |
    And the following users exist
    | id | email         | password | admin | donor_id |
    | 1  | foo@foo.com   | password | true  | nil      |
    | 2  | bar@bar.com   | password | false | 1        |

  Scenario: When I am not an admin, I should not be able to visit the admin portal
    Given I sign in with email "bar@bar.com" and password "password"
    And I am on the admin page
    Then I should be on the donor page for "John Smith"
    
  Scenario: When I am an admin, I should be able to visit the admin portal
    Given I sign in with email "foo@foo.com" and password "password"
    And I go to the admin page
    Then I should be on the admin page
    
  Scenario: When I am not signed in, I should be taken to the sign in page when visiting the admin portal
    Given I am on the admin page
    Then I should be on the sign in page
    
  Scenario: When on the admin page, I should see the names of all the models
    Given I sign in with email "foo@foo.com" and password "password"
    Given I am on the admin page
    Then I should see "Hospitals"
    And I should see "Donors"
    And I should see "Dedications"

  Scenario: When on the admin page, I should be able to add data
    Given I sign in with email "foo@foo.com" and password "password"
    And I am on the hospital page of admin
    And I create a hospital with name "Hospital 2", surgeries "10", and cost "30000"
    Then I am on the hospital page for "Hospital 2"
    And I should see "Hospital 2"
    And I should see "Surgeries: 10"
    And I should see "Cost: 30000"

  Scenario: When on the admin page, I should be able to hide data
    Given I sign in with email "foo@foo.com" and password "password"
    And I am on the hospital page of admin
    Then I should see "Hospital 3"
    And I hide a hospital with name "Hospital 3"
    And I am on the home page
    Then I should not see "Hospital 3"
    
  Scenario: When on the admin page, I should be able to update existing data
    Given I sign in with email "foo@foo.com" and password "password"
    And I am on the hospital page of admin
    Then I should see "Hospital 1"
    And I update a hospital with name "Hospital 1", to have surgeries "20"
    Then I am on the hospital page for "Hospital 1"
    And I should see "Surgeries: 20"
    