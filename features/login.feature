Feature: User Login
	In order to login
	As a user
	I want to see my login status

	@wip
	Scenario: can use login action
		Given I am not login with I remember my username and my password
		When I fill "username_text" with my username
		And I fill "password_text" with my password
		And I click Login button
		Then I shall see home webpage