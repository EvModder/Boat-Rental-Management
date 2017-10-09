Feature: Sign Up
As a user
I want to see the sign up link
So I can create an account

Background:
Given the user is on the homepage

Scenario: User sees the sign up link
Then the user should see the sign up link

Scenario: User sees the login link
Then the user should see the Login link

Scenario: User clicks the Sign up link
When the user click the Sign Up link
Then the user should see the sign pop

Scenario: User logged in
When the user click the Login link
Then the user should see logout link

Scenario: User signs up with valid data
When the user sign up valid user data
Then the user should see a successful sign up message

Scenario: User signs up with invalid email
When the user signs up with an invalid email
Then the user should see an invalid email message

Scenario: User signs up without password
When the user sign up without a password
Then the user should see a missing password message

Scenario: User signs up without password confirmation
When the user sign up without a password confirmation
Then the user should see a missing password confirmation message

Scenario: User signs up with mismatched password and confirmation
When the user sign up with a mismatched password confirmation
Then the user should see a invalid password message



