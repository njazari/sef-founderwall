Feature: Google Maps View of Hospitals
    As a user
    I want to see the location of a hospital on Google Maps
    So that I can see which hospital my donation is going to

  Background:
    Given the wall is set up
    Given the following hospitals exist
    | id | name | surgeries  | cost | lat | lng |
    | 1  | Hospital 1 | 4 | 60000 | 33.33 | 88.66 |
    | 2  | Hospital 2 | 10 | 20000 | 26.26 | 55.55 |

    And I am on the hospital page for "Hospital 2"
    
  Scenario: When on a Hospital page, I should see the Google Map rendering of the Hospital’s location
    And I should see "26.26"
    And I should see "55.55"
