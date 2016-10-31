Given(/^I should see the "([^"]*)" button$/) do |media_type|
    expect(page).to have_css(".ssb-icon.ssb-#{media_type.downcase!}")
end

Given(/^I click "([^"]*)" button$/) do |arg1|
   find(:css, '.ssb-icon.ssb-facebook').click
end