Feature: User visits the Home Page
    In order to read the page
    As a user
    I want to see the home page of Ideahub

    Background:
        Given I am not logged in

   Scenario: Find the link to the form to browse ideas
        Given I am on the home page
        Then I should see "Browse Ideas" button

    Scenario: Find the link to the form to create idea
        Given I am on the home page
        Then I should see "Create Idea" button

    Scenario: Find the twitter link to the form to login through twitter
        Given I am on the home page
        Then I should see "twitter" link

    Scenario: Find the link to the form
        Given I am on the home page
        Then I should see "About" link

    Scenario: User views ideas
        Given I am on the home page
        When I click "Browse Ideas" link
        Then I should see ideas

    Scenario: User views login page
        Given I am on the home page
        When I click "Create Idea" link
        Then I should see login page

    Scenario: User views login page
        Given I am on the home page
        When I click "twitter" link
        Then I should see login page

   Scenario: User views drop down list
        Given I am on the home page
        When I click on "About" link
        Then I should see drop down list

   Scenario: User should see only 4 ideas
        Given I am on the home page
        Then I should see only 4 ideas
