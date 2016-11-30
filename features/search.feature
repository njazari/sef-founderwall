Feature: Search for data
  
  As a user
  I want to be able to search for information
  So that I can easily and quickly find what I am looking for
  
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
    | 3  | Silver | Go Sankara! | 2 | 3 | true |
    | 4  | Platinum | I love eyes! | 1 | 1 | true |
    
    Scenario: When I search for a donor's name, I should only see the dedications for that donor
      Given I am on the all dedications page
      And I fill in "filterrific_search_query" with "John Smith"
      Then I am on the dedications page for query "John Smith"
      Then I should see "For the kids"
      And I should see "I love eyes!"

    Scenario: When I search for a donor's name, I should not see the dedications for other donors
      Given I am on the all dedications page
      And I fill in "filterrific_search_query" with "John Smith"
      Then I am on the dedications page for query "John Smith"
      Then I should not see "John Williams"
      And I should not see "For the Adults"
      And I should not see "Tina Martinez"
      And I should not see "Go Sankara!"
    
    Scenario: When I search dedications to a hospital, I should only see dedications for that hospital 
      Given I am on the all dedications page
      And I fill in "filterrific_search_query" with "Hospital 1"
      Then I am on the dedications page for query "Hospital 1"
      Then I should see "For the kids"
      And I should see "For the adults"
      And I should see "I love eyes!"
      And I should not see "Go Sankara!"
      
    Scenario: When I search for a name that does not exist, I should not see any dedications
      Given I am on the all dedications page
      And I fill in "filterrific_search_query" with "SPAM SPAM"
      Then I am on the dedications page for query "SPAM SPAM"
      Then I should not see "Go Sankara!"
      And I should see "No dedications found"
      