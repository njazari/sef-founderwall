Given(/^the wall is set up$/) do
end

Given(/^the following hospitals exist\$$/) do |hospitals|
  hospitals.hashes.each do |hospital|
    Hospital.create!(hospital)
  end
end

Then(/^I should see "([^"]*)" before "([^"]*)"$/) do |hospital1, hospital2|
  regexp = /#{hospital1}.*#{hospital2}/m
  page.body.should =~ regexp
end