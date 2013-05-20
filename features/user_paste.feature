Feature: User paste something
	As a user
	I want to paste something

	Scenario: paste some words with default option with login user
		Given I am already login
		And "paste expiration" default is "never"
		And "Paste Exposure" default is "public"
		And words is "hello world"
		When I fill "paste_text" with words
		And I click "submit" button
		Then I shall see that it is redirect back to profile page with the pasted words show in profil
		e page.

	Scenario: paste some words with default paste expiration option and private paste exposure option with login user
		Given I am already login
		And "paste expiration" default is "never"
		And "paste exposure" default is "public"
		And words is "hello world"
		When I fill "paste_text" with words
		And change "paste exposure" to "private"
		And I click "submit" button
		Then I shall see that it is redirect back to profile page with the pasted words show in profil
		e page.
		And its "page exposure" set to private
		And it should not appear in main page

	Scenario: paste some words with default paste exposure option and 10 minutes paste expiration option with login user
		Given I am already login
		And "paste expiration" default is "never"
		And "paste exposure" default is "public"
		And words is "hello world"
		When I fill "paste_text" with words
		And change "paste expiration" to "10 minutes"
		And I click "submit" button
		Then I shall see that it is redirect back to profile page with the pasted words show in profil
		e page. 
		And after 10 minute the paste should disappear

	Scenario: paste some words with 10 minutes paste expiration option and private paste exposure option with login user
		Given I am already login
		And "paste expiration" default is "never"
		And "paste exposure" default is "public"
		And words is "hello world"
		When I fill "paste_text" with words
		And change "paste exposure" to "private"
		And I click "submit" button
		Then I shall see that it is redirect back to profile page with the pasted words show in profil
		e page.
		And its "page exposure" set to private
		And it should not appear in main page
		And after 10 minute the paste should disappear

	Scenario: paste with no words
		Given "paste expiration" default is "never"
		And "paste exposure" default is "public"
		When I click "submit" button
		Then The page will show that I can't paste the empty

	Scenario: paste some words with default paste expiration option and private paste exposure option with not login user
		Given I am not login
		And "paste expiration" default is "never"
		And "paste exposure" default is "public"
		And words is "hello world"
		When I fill "paste_text" with words
		And change "paste exposure" to "private"
		Then I shall see that I can't change "paste exposure" to "private"