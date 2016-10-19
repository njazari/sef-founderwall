Then(/^I should see "([^"]*)" before "([^"]*)"$/) do |hospital1, hospital2|
  regexp = /#{hospital1}.*#{hospital2}/m
  page.body.should =~ regexp
end