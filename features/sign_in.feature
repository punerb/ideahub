Feature: Sign in
	In order to get access to protected sections of the site
	As a user
	I Should be able to sign in

  
	 Background:
        	 Given I am not logged in

 
	Scenario: View home page
        	Given I am on a login page
		When I sign in with valid credentials
		Then I should visit home page
