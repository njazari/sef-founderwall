Given(/^the wall is set up$/) do
end

Given(/^the following hospitals exist\$$/) do |hospitals|
  hospitals.hashes.each do |hospital|
    Hospital.create!(hospital)
  end
end

Then(/^I should see the latitude$/) do
end

Then(/^I should see the longitude/) do
end

Then(/^I should see a pin on the map$/) do
#   expect(page).to have_selector('#markers img', count: 1)
end