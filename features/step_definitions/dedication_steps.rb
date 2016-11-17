When /^(?:|I )click on "([^"]*)"$/ do |button|
  first(:button, button, minimum: 1).click
end