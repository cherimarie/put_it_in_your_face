require 'spec_helper'

feature "Deleting ingredients" do
	scenario "Deleting a project" do
		Factory(:ingredient, :name => "lengua")
		visit "/ingredients"
		click_link "lengua"
		click_link "Delete Ingredient"
		page.should have_content("Ingredient has been deleted.")

		visit "/ingredients"
		page.should_not have_content("lengua")
	end
end