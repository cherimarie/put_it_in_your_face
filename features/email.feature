Feature: Email
Users get weekly emails with their personalized meal plans and shopping lists

Scenario: A user has set their preferences to get meal plans for a single, size medium human with no dietary restrictions. Their weekly email will contain meal plans and shopping list specific to their needs.
Given I have an account
And my preferences are set to one human, size medium, with no dietary restrictions
When I receive my weekly email
Then it will contain a list of 14 meals
And at least 8 of the meals will be unique
And each meal will be a link to the recipe on the Slacker Meal site
And the email will contain a shopping list of all the ingredients for all of the meals
And the ingredients for each meal will total between 650 and 750 calories
And the ingredients for each meal will total between 10 and 16g of protein
And the ingredients for each meal will total between 275 and 325mg of calcium