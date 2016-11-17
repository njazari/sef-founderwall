# Not implementing this until iter4 due to lack of Denari RESTful API
# Will rewrite these scenarios when we sort out how to use the API

# Feature: Denari API sync                              
#     As an admin
#     I want to be able to make an edit on the web app
#     So that it is also edited in Denari
    
# Scenario: Get hospital data from Denari (happy path)
#     # need to find correct id and hospital name to use
#     # these are placeholders for now
#     Given I send a GET request to denari for hospital with id "1"
#     Then the response status should be "200"
#     And the JSON output should have hospital name "Sankara Eye Hospital"
    
# Scenario: Get hospital data from Denari (sad path)
#     Given I send a GET request to denari for hospital with id "-1"
#     Then the response status should be "404"
    
# Scenario: Post new hospital data to denari
#     Given I send a POST request to denari for hospital with new data "Test Hospital 1"
#     Then the response status should be "201"
    
# Scenario: Get donor data from Denari (happy path)
#     Given I send a GET request to denari for donor with id "1"
#     Then the response status should be "200"
#     And the JSON output should have donor name "Alice Bob"
  
# Scenario: Get donor data from Denari (sad path)
#     Given I send a GET request to denari for donor with id "-1"
#     Then the response status should be "404"
    
# Scenario: Post new donor data to denari successfully 
#     Given I send a POST request to denari for donor with new data "Test Donor 1"
#     Then the response status should be "201"
    
# Scenario: Admin refreshes data from Denari
#     Given I sign in with email "admin@admin.com" and password "password"
#     And I am on the admin page
#     And I press "Refresh Database"
#     Then I should see "Test Hospital"