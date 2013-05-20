Feature: User view the paste
	As a user
	I want to view the paste made by other or myself

	Scenario: view public paste via link
		Given I have the paste url
		When I when go to url
		Then I shall see the paste

	Scenario: view my pastes
		Given I am already login
		And I have pasted some paste
		When I when go to my profile page
		Then I shall see all of my past pastes

	Scenario: view public paste via main page
		Given I am already in main page
		When I when go to one of the public pastes link
		Then I shall see the paste