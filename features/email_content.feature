Feature: Email
Users get weekly emails with their personalized meal plans and shopping lists

	Scenario: The user's weekly email will contain meal plans and shopping list specific to their needs.
		Given I have an account
		And my preferences are set to one human, size medium, with no dietary restrictions
		When I receive my weekly email
		Then it will contain a list of 14 meals
		And at least 8 of the meals will be unique
		And each meal will be a link to the recipe on the Slacker Meal site
		And the email will contain a shopping list of all the ingredients for all of the meals
