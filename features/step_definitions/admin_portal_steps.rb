Given /^the following users exist$/ do |table|
    User.create table.hashes
end

Given(/^I sign in with email "([^"]*)" and password "([^"]*)"$/) do |email, password|
  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Log in"
end

Given(/^I create a hospital with name "([^"]*)", surgeries "([^"]*)", and cost "([^"]*)"$/) do |name, surgeries, cost|
  Hospital.create(:name => name, :surgeries => surgeries, :cost => cost)
end

Given(/^I delete a hospital with name "([^"]*)"$/) do |name|
  Hospital.delete(Hospital.where(:name => name).pluck(:id)[0])
end

Given(/^I update a hospital with name "([^"]*)", to have surgeries "([^"]*)"$/) do |hospital_name, hospital_surgeries|
  h = Hospital.find_by(name: hospital_name)
  h.update(surgeries: hospital_surgeries)
end