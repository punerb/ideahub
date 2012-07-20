Feature: Sign out
	To protect my account from unauthorized access
	As a signed in user
	I Should be able to sign out


	Background:
		Given I am logged in

	Scenario: User signs out
		When I Sign out
		Then I should see the home page

