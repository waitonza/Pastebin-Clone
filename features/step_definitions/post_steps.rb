Given(/^I go to create new pastebin page$/) do
  	click_link "Create new Pastebin"
end

When(/^I fill "(.*?)" with my name of paste$/) do |name|
	fill_in "post_name", :with => name
end

When(/^I fill "(.*?)" with my paste content$/) do |content|
	fill_in "post_paste_content", :with => content
end

When(/^I click Submit button to post$/) do
	click_button "Submit"
end

Then(/^I shall see the result with by "(.*?)"$/) do |username|
  	page.should contain("You Paste successfully")
  	page.should contain("Paste Bin - Show")
 	page.should contain(username)
end

Then(/^I back to web index page to see the result with name "(.*?)" by "(.*?)"$/) do |name, username|
	click_link "Back to home page"
 	page.should contain("Listing Pastes")
 	page.should contain(name)
 	page.should contain(username)
end

Then(/^I shall see the result with new paste error$/) do
 	page.should contain("Form is invalid")
end

Then(/^I click show$/) do
  	click_link "Show"
end

Then(/^I shall see the result with content "(.*?)" by "(.*?)"$/) do |content, username|
  	page.should contain("Paste Bin - Show")
 	page.should contain(content)
 	page.should contain(username)
end