Given(/^I should see the "([^"]*)" social media button$/) do |media_type|
    expect(page).to have_css(".ssb-icon.ssb-#{media_type.downcase!}")
end