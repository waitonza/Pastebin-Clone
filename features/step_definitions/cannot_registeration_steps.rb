Given(/^I go to Registeration page$/) do
	click_link "Registeration"
end

When(/^I fill "(.*?)" with my username to register$/) do |username|
	fill_in "user_username", :with => username
end

When(/^I fill "(.*?)" with my email to register$/) do |email|
	fill_in "user_email", :with => email
end

When(/^I fill "(.*?)" with my password to register$/) do |password|
	fill_in "user_password", :with => password
end

When(/^I fill "(.*?)" with my password Confirmation to register$/) do |password_confim|
	fill_in "user_password_confirmation", :with => password_confim
end

When(/^I click Signup button to register$/) do
	click_button "Signup"
end

Then(/^I shall see signup page with errors$/) do
	page.should contain("Form is invalid")
end