Feature: Send emails to admin
  As a donor
  I want to be able to contact the admin
  So I can edit my dedicaiton/express my concerns

    
  Scenario: When I click on the contact link, I should be on the contact page
    Given I am on the home page
    And I follow "Contact"
    Then I should be on the new contact page
    
  Scenario: When I submit a valid message, I should get confirmation that the email is sent
    Given I am on the new contact page
    And I fill in "Name" with "John Doe"
    And I fill in "Email" with "jdoe@gmail.com"
    And I fill in "Message" with "This is a test"
    And I press "Send message"
    Then I should see "Thank you for your message!"
    
  Scenario: When I enter an invalid email, I should get an error
    Given I am on the new contact page
    And I fill in "Name" with "John Doe"
    And I fill in "Email" with "jdoe"
    And I press "Send message"
    Then I should see "is invalid"
    
  Scenario: When I leave the name blank, I should get an error
    Given I am on the new contact page
    And I fill in "Email" with "jdoe@gmail.com"
    And I press "Send message"
    Then I should see "can't be blank"
    
  Scenario: When I fill in the nickname field, I should be marked as spam
    Given I am on the enw contact page 
    And I fill in "Name" with "John Doe"
    And I fill in "Email" with "jdoe@gmail.com"
    And I fill in "Nickname" with "SPAM"
    And I press "Send message"
    Then I should see "Sorry, this message appears to be spam and was not delivered."