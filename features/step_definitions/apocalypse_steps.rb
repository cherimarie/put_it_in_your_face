Given /^I am on the apocalypse shopping list page$/ do
  visit "/apocalypse"
end

Given /^I enter in (\d+) survivor$/ do |number|
  select("#{number}", :from => 'survivor_count')
end

Given /^I specify medium\-sized$/ do
  select("medium", :from => 'survivor_size')
end

When /^I click on 'feed me'$/ do
  click_button "feed me"
end

Then /^I should see 'Shopping List'$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the shopping list should include ingredients for (\d+) meals$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^the shopping list should include ammo$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the shopping list should include TP$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see a list of 'Meals' which are links to 'Recipes'$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^if i click on a single 'Meal', it will take me to a 'Recipe' page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the 'Recipe' page will show me how to prepare that meal$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^it should tell me how to prepare a bunch of MREs$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I enter in (\d+) survivors$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given /^I specify medium\-sized and large$/ do
  pending # express the regexp above with the code you wish you had
end