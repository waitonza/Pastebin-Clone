Feature: User Sign Up / Login
	In order to Sign Up Then login
	As a user
	I want to see my login status

	Scenario: can use login action but it cannot login
		Given I am not login
		And I go to login page
		When I fill "username_text" with my username to login
		And I fill "password_text" with my password to login
		And I click Login button to login
		Then I shall see login page with errors

	Scenario: cannot registeration because error
		Given I am not login
		And I go to Registeration page
		When I fill "ABCD" with my username to register
		And I fill "abcd@gmail.com" with my email to register
		And I fill "1234567" with my password to register
		And I fill "123456" with my password Confirmation to register
		And I click Signup button to register
		Then I shall see signup page with errors

	Scenario: can registeration with successful
		Given I am not login
		And I go to Registeration page
		When I fill "ABCD" with my username to register
		And I fill "abcd@gmail.com" with my email to register
		And I fill "1234567" with my password to register
		And I fill "1234567" with my password Confirmation to register
		And I click Signup button to register
		Then I shall see web index page with signup successful

	Scenario: can login as a user with successful
		Given I am not login
		And I setup my user registeration with username "ABCD", email "abcd@gmail.com", password "1234567"
		And I go to login page
		When I fill "ABCD" with my username to login
		And I fill "1234567" with my password to login
		And I click Login button to login
		Then I shall see web index page with login successful
		And I shall see logout link