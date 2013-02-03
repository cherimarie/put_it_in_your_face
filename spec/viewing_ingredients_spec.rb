require 'spec_helper'

feature "viewing ingredients" do |variable|
	scenario "listing all ingredients" do
		ingredient = Factory.create(:ingredient, :name => "bell pepper")
		visit '/ingredients'
		click_link "bell pepper"
		page.current_url.should == ingredient_url(ingredient)
	end
end