Feature: User Login
	In order to login
	As a user
	I want to see my login status

	Scenario: successful login
		Given I am not login
		And I remember my username 
		And I remember my password
		When I fill "username_text" with my username
		And I fill "password_text" with my password
		And I click Login button
		Then I shall see my login status that show successful login

	Scenario: not registered user
		Given I am not login
		And I do not register 
		When I fill "username_text" with random word
		And I fill "password_text" with random word
		And I click Login button
		Then I shall see my login status that show user not registered

	Scenario: invalid password
		Given I am not login
		And I remember my username 
		And I don't remember my password
		When I fill "username_text" with my username
		And I fill "password_text" with random word
		And I click Login button
		Then I shall see my login status that show wrong password
	
	Scenario: no username input
		Given I am not login
		When I fill "password_text" with random word
		And I click Login button
		Then I shall see my login status that show "username_text" is empty

	Scenario: no password input
		Given I am not login
		And I remember my username 
		When I fill "username_text" with random word or my username
		And I click Login button
		Then I shall see my login status that show "password_text" is empty

	Scenario: no input
		Given I am not login
		And I remember my username 
		When I leave "username_text" blank
		And I leave "password_text" blank
		And I click Login button
		Then I shall see my login status that show "username_text" is empty
		And I shall see my login status that show "password_text" is empty