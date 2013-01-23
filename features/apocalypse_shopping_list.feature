Feature: Apocalypse shopping list
  As a survivor I need to stock my bunker
  In order to feed myself for a year.

Scenario: Sole survivor
  Given I am on the apocalypse shopping list page
  And I enter in 1 survivor
  And I specify medium-sized
  When I click on 'feed me'
  Then I should see 'Shopping List'
  And the shopping list should include ingredients for 1095 meals
  And the shopping list should include ammo
  And the shopping list should include TP
  And I should see a list of 'Meals' which are links to 'Recipes'
  And if i click on a single 'Meal', it will take me to a 'Recipe' page
  And the 'Recipe' page will show me how to prepare that meal
  And it should tell me how to prepare a bunch of MREs

Scenario: Dangerous duo
  Given I am on the apocalypse shopping list page
  And I enter in 2 survivors
  And I specify medium-sized and large
  When I click on 'feed me'
  Then I should see 'Shopping List'
  And the shopping list should include ingredients for 2100 meals
  And if i click on a single 'Meal', it will take me to a 'Recipe' page
  And the 'Recipe' page will show me how to prepare that meal
  And the shopping list should include ammo
  And the shopping list should include TP
  And I should see a list of 'Meals' which are links to 'Recipes'
  And it should tell me how to prepare a bunch of MREs