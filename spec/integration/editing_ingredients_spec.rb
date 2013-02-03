require 'spec_helper'

feature "Editing Ingredients" do
	before do
		Factory(:ingredient, :name => "avocado")
		visit "/ingredients"
		click_link "avocado"
		click_link "Edit"
	end

	scenario "Updating an ingredient" do
		fill_in "Name", :with => "super avocado"
		click_button "Update Ingredient"
		page.should have_content("Ingredient was successfully updated.")
	end

	scenario "Updating an ingredient with no name is bad" do
		fill_in "Name", :with => ""
		click_button "Update Ingredient"
		page.should have_content("Name can't be blank")
	end
end
