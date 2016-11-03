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
  visit '/admin/hospital/new'
  fill_in "hospital_name", :with => name 
  fill_in "hospital_surgeries", :with => surgeries
  fill_in "hospital_cost", :with => cost
  click_button "Save"
end

Given(/^I hide a hospital with name "([^"]*)"$/) do |hospital_name|
  h = Hospital.find_by(name: hospital_name)
  visit '/admin/hospital/' + h.id.to_s + '/edit'
  uncheck 'hospital_status'
  click_button "Save"
end

Given(/^I update a hospital with name "([^"]*)", to have surgeries "([^"]*)"$/) do |hospital_name, hospital_surgeries|
  h = Hospital.find_by(name: hospital_name)
  visit '/admin/hospital/' + h.id.to_s + '/edit'
  fill_in "hospital_surgeries", :with => hospital_surgeries
  click_button "Save"
end