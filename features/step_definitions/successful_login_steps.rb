Given(/^I am not login with I remember my username and my password$/) do
	visit web_index_path
	click_link "Login"
end

When(/^I fill "(.*?)" with my username$/) do |username|
	fill_in "Username", :with => username
end

When(/^I fill "(.*?)" with my password$/) do |password|
	fill_in "Password", :with => password
end

When(/^I click Login button$/) do
	click_button "Login"
end

Then(/^I shall see my login status that show successful login$/) do
	page.should contain("Logined!")
end