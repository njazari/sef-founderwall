Feature: Admin portal
    As an admin
    I want an admin portal
    So that I can edit data
  
  Background:
    Given the following hospitals exist
    | id | name | surgeries  | cost |
    | 1  | Hospital 1 | 10 | 20000 |
    And the following donors exist
    | id | first_name | last_name  | email | phone |
    | 1  | John | Smith | jsmith@gmail.com | 123-456-7890 |
    | 2  | John | Williams | jw123@yahoo.com  | 213-345-9824 | 
    | 3  | Tina | Martinez | tmart@gmail.com | 253-726-9827 |
    And the following dedications exist
    | id | tier | dedication  | hospital_id | donor_id | status |
    | 1  | Platinum | For the kids | 1 | 1 | true |
    | 2  | Gold | For the adults   | 1 | 2 | true |
    | 3  | Silver | Go Sankara! | 1 | 3 | false |
    And the following users exist
    | id | username | password | admin? |
    | 1  | foo      | password | true   |
    | 2  | bar      | password | false  | 

  Scenario: When I am not an admin, I should not be able to visit the admin portal
    Given I am user "bar"
    And I try to visit the admin page
    Then I should be on the error page
    
  Scenario: When I am an admin, I should be able to visit the admin portal
    Given I am user "foo"
    And I try to visit the admin page
    Then I should be on the admin page
    
  Scenario: When on the admin page, I should see the names of all the models
    Given I am on the admin page
    Then I should see "Hospitals"
    And I should see "Donors"
    And I should see "Dedications"

  Scenario: When on the admin page, I should be able to add data
    Given I am user "foo"
    And I am on the "Hospital" page of "Admin"
    And I create a hospital with name "Hospital 2", surgeries "10", and cost "30000"
    Then I am on the hospital page for "Hospital 2"
    And I should see "Hospital 2"
    And I should see "Surgeries: 10"
    And I should see "Cost: 30000"

  Scenario: When on the admin page, I should be able to delete data
    Given I am user "foo"
    And I am on the "Hospital" page of "Admin"
    Then I should see "Hospital 2"
    And I delete a hospital with name "Hospital 2"
    And I am on the "Hospital" page of "Admin"
    Then I should not see "Hospital 2"
    
  Scenario: When on the admin page, I should be able to update existing data
    Given I am user "foo"
    And I am on the "Hospital" page of "Admin"
    Then I should see "Hospital 1"
    And I update a hospital with name "Hospital 1", to have surgeries "20"
    Then I am on the hospital page for "Hospital 2"
    And I should see "Surgeries: 20"
    
    