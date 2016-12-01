# Wall of Founders
Wall of Founders for Sankara Eye Foundation (Fall16 CS169 Project)

[![Code Climate](https://codeclimate.com/github/njazari/sef-founderwall/badges/gpa.svg)](https://codeclimate.com/github/njazari/sef-founderwall)
[![Test Coverage](https://codeclimate.com/github/njazari/sef-founderwall/badges/coverage.svg)](https://codeclimate.com/github/njazari/sef-founderwall/coverage)
[![Build Status](https://travis-ci.org/njazari/sef-founderwall.svg?branch=master)](https://travis-ci.org/njazari/sef-founderwall)

[Heroku Prototype](https://sef-founderwall.herokuapp.com)

[Pivotal Tracker](https://www.pivotaltracker.com/n/projects/1885913)

[Sankara Eye Foundation](http://www.giftofvision.org)

The Sankara Eye Foundation (SEF) initiates and drives eye care activities in India for the impoverished. As of 2014, SEF has
provided over 1.25 million free eye surgeries in India. Donors who donate in excess of $1000 are eligible to be featured on the “Wall of Founders” 
built ~5 years after donating & located at the hospital in India.

In an effort to increase donor retention rate and attract new donors, SEF is making a Digital Wall of Founders. The Digital Wall of Founders
is a vitrual impression of each hospital's physical Wall of Founders and displays donors’ names and dedication messages for each donation.
The Digital Wall also shows donation tiers and provides social media sharing and search options. 
The Digital Wall serves as relatively instant recognition for donors who wouldn’t otherwise get it until years later.

Setup/Testing
-------------
1. Install ruby, rvm, rails, cucumber.  
2. Clone this repo  

    $ git clone https://github.com/njazari/sef-founderwall.git  

3. Run the following from the project's root path:

    $ bundle install
    $ rake db:setup

4. Run app on localhost:  

    $ rail s
    
5. Run Cucumber tests

    $ rake cucumber

