Feature: Meal Plan
Users get meal plans that are tailored nutritionally to their needs.

	Scenario: The user's weekly meal plan will be specific to their needs.
		Given I am logged in
		And my preferences are set to one human, size medium, with no dietary restrictions
		Then my weekly meal plan will contain a list of 14 meals
		And at least 8 of the meals will be unique
		And the ingredients for each meal will total between 650 and 750 calories
		And the ingredients for each meal will total between 10 and 16g of protein
		And the ingredients for each meal will total between 275 and 325mg of calcium
