Then(/^I shall see web index page with signup successful$/) do
	page.should contain("You Signed up successfully")
end

Given(/^I setup my user registeration with username "(.*?)", email "(.*?)", password "(.*?)"$/) do |username, email, password|
	click_link "Registeration"
	fill_in "user_username", :with => username
	fill_in "user_email", :with => email
	fill_in "user_password", :with => password
	fill_in "user_password_confirmation", :with => password
	click_button "Signup"
end

Then(/^I shall see web index page with login successful$/) do
	page.should contain("Wow Welcome again, you logged in as")
end

Then(/^I shall see logout link$/) do
	page.should contain("Logout")
end