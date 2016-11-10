Then(/^I should see "([^"]*)" before "([^"]*)"$/) do |hospital1, hospital2|
  regexp = /#{hospital1}.*#{hospital2}/m
  page.body.should =~ regexp
end

Then(/^I should not see "([^"]*)" before "([^"]*)"$/) do |hospital1, hospital2|
  regexp = /#{hospital1}.*#{hospital2}/m
  page.body.should_not =~ regexp
end

Then(/^I should see dedication with id "([^"]*)" before dedication with id "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end
