Feature: Purchase Boardwalk
	In Order to purchase the Boardwalk
	A user
	Needs to have the funds available
	And will pay the bank the purchase price
	
Background:
	Given the user is initialized
	And has $1000 in his account
	
Scenario: Purchasing the Boardwalk
	Given the user has landed on Boardwalk
	And it is owned by the Bank
	And the player has $400 in her account
	When the user is updated
	Then the user should have $400 less in her account
	And the user should have Boardwalk in her property list