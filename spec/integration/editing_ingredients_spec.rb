require 'spec_helper'

feature "Editing Ingredients" do
	scenario "Updating an ingredient" do
		Factory(:ingredient, :name => "avocado")
		visit "/ingredients"
		click_link "avocado"
		click_link "Edit"
		fill_in "Name", :with => "super avocado"
		click_button "Update Ingredient"
		page.should have_content("Ingredient was successfully updated.")
	end
end
