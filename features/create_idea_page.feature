Feature: User should create an idea
	In order to create an idea
	As a user
	I should be able fill the information

    
	Background:
		Given I am logged in

	Scenario: Fill in details to create idea
        	Given I am on the home page
	        When I click "Create Idea" or "Create" link
        	Then I should see Details page
	        When I fill in "Title" with "Test Idea"
	        And I fill in "Github" with "http://github.com/"
	        And I fill in "Description" with "Test description"
	        And I fill in "Categories" with "Misc"
	        And I click "Create Idea"
	        Then I should see created ideas

	Scenario: Should be able to browse ideas
	        Given I am on the home page
	        When I click "Browse Ideas" or "Browse" link
        	Then I should see created ideas
