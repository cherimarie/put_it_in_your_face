require 'spec_helper'

feature "Meal Generation" do
	scenario "Generating a meal" do
		listy = IngredientList.new

		listy.generate	({calories: 650..750,
							  	protein: 10..16,
							  	calcium: 275..325})
		listy.calories.should eq 650..750
		listy.protein.should  eq 10..16
		listy.calcium.should  eq 275..325
	end
end
#
# bit code
# takes in nutrient value ranges
# 	which are selected by human size data
# 	and stuff we are not doing now
# searching ingredients table
# selecting a group of ingredients that together equal those ranges
# outputting a list of ingredients
#
#
#
#
# feature "Deleting ingredients" do
# 	scenario "Deleting a project" do
# 		Factory(:ingredient, :name => "lengua")
# 		visit "/ingredients"
# 		click_link "lengua"
# 		click_link "Delete Ingredient"
# 		page.should have_content("Ingredient has been deleted.")
#
# 		visit "/ingredients"
# 		page.should_not have_content("lengua")
# 	end
# end