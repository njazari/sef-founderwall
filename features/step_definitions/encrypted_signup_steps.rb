Given (/^I sign up as donor ([0-9]+) with the correct secret$/) do |donor_id|
    visit "users/sign_up?donor_id=" + donor_id + "&secret=" + Donor.find(donor_id).secret
    fill_in "user_password", :with => "password"
    fill_in "user_password_confirmation", :with => "password"
    click_button "Sign up"
end

Given (/^I sign up as donor ([0-9]+) with an incorrect secret$/) do |donor_id|
    visit "users/sign_up?donor_id=" + donor_id + "&secret=not" + Donor.find(donor_id).secret
    fill_in "user_password", :with => "password"
    fill_in "user_password_confirmation", :with => "password"
    click_button "Sign up"
end