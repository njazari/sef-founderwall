When(/^I slect "([^"]*)" from "([^"]*)"$/) do |option, list|
  select option, :from => list
end