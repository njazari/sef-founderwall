When /^(?:|I )click on "([^"]*)"$/ do |link|
  first(:link, link).click
end