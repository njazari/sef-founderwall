Feature: Google Maps View of Hospitals
    As a user
    I want to see the location of a hospital on Google Maps
    So that I can see which hospital my donation is going to

  Background:
    Given the following hospitals exist
    | id | name | surgeries  | cost | lat | lng |
    | 1  | Hospital 1 | 10 | 20000 | 26.26 | 55.55 |
    And I am on the hospital page for “Hospital 1”
    Scenario: When on a Hospital page, I should see the Google Map rendering of the Hospital’s location
    Then I should see the title “Hospital 1 Location”
    And I should see a pin on the map
    And I should see the latitude "26.26"
    And I should see the longitude "55.55"