Feature: Boat Posting
As a boat owner
I want to upload my boat's info with picture
So others could look for my boat.

Background:
Given the user is on the boat index page

Scenario: User sees boats
Then I should see the renting boats

Scenario: User sees boats' names
Then I should see the renting boat‘s names

Scenario: User sees boat's description
Then I should see the renting boat’s description

Scenario: User sees boat's picture
Then I should see the renting boat's picture

Scenario: User can check boat's details
When I click the "Details" link
Then I should be able to check the boat's details

Scenario: User can edit boat's details
When I click the "Edit" link
Then I should be able to edit the boat's details

Scenario: User can remove boat
When I click the "Destroy" link
Then I should be able to remove the boat

Scenario: User can upload new boat
When I click "New Boat"
Then I shold be able to post a boat info