Given /^the following users exist$/ do |table|
    User.create table.hashes
end

Given(/^I am user "([^"]*)"$/) do |user|
  @current_user = User.where(:email => user).first
end

Given(/^I create a hospital with name "([^"]*)", surgeries "([^"]*)", and cost "([^"]*)"$/) do |name, surgeries, cost|
  Hospital.create(:name => name, :surgeries => surgeries, :cost => cost)
end

Given(/^I delete a hospital with name "([^"]*)"$/) do |name|
  Hospital.where(:name => name).delete
end

Given(/^I update a hospital with name "([^"]*)", to have surgeries "([^"]*)"$/) do |name, surgeries|
  h = Hospital.where(:name => name)
  h.surgeries = surgeries
  h.save
end