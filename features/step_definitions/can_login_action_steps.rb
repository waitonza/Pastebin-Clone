Given(/^I am not login$/) do
  	visit web_index_path
  	page.should contain("Login")
 	page.should contain("Registeration")
end

Given(/^I go to login page$/) do
  	click_link "Login"
end

When(/^I fill "(.*?)" with my username to login$/) do |username|
	fill_in "username", :with => username
end

When(/^I fill "(.*?)" with my password to login$/) do |password|
	fill_in "password", :with => password
end

When(/^I click Login button to login$/) do
	click_button "Log In"
end

Then(/^I shall see login page with errors$/) do
	page.should contain("Invalid Username or Password")
end