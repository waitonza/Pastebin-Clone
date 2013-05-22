Feature: User can Post Paste
	In order to Post Paste Then see the result

	Scenario: post without user login
		Given I am not login
		And I go to create new pastebin page
		When I fill "Test Paste" with my name of paste
		And I fill "Paste Content Test" with my paste content
		And I click Submit button to post
		Then I shall see the result with by "Anonymous"
		Then I back to web index page to see the result with name "Test Paste" by "Anonymous"
		And I click show
		Then I shall see the result with content "Paste Content Test" by "Anonymous"

	Scenario: post with user login
		Given I am not login
		And I setup my user registeration with username "ABCD", email "abcd@gmail.com", password "1234567"
		And I go to login page
		When I fill "ABCD" with my username to login
		And I fill "1234567" with my password to login
		And I click Login button to login
		Then I shall see web index page with login successful
		And I shall see logout link

		And I go to create new pastebin page
		When I fill "Test Paste" with my name of paste
		And I fill "Paste Content Test" with my paste content
		And I click Submit button to post
		Then I shall see the result with by "ABCD"
		Then I back to web index page to see the result with name "Test Paste" by "ABCD"
		And I click show
		Then I shall see the result with content "Paste Content Test" by "ABCD"

	Scenario: post with error
		Given I am not login
		And I setup my user registeration with username "ABCD", email "abcd@gmail.com", password "1234567"
		And I go to login page
		When I fill "ABCD" with my username to login
		And I fill "1234567" with my password to login
		And I click Login button to login
		Then I shall see web index page with login successful
		And I shall see logout link
		
		And I go to create new pastebin page
		When I fill "" with my name of paste
		And I fill "" with my paste content
		And I click Submit button to post
		Then I shall see the result with new paste error