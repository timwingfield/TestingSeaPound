Feature: Check Environment
	In Order to verify my cucumber setup
	A player
	Needs to be initialized
	
Scenario: Checking my environment
	Given the player "Car" is initialized to start a game
	When I check the player balance
	Then the account balance should be $"2000"