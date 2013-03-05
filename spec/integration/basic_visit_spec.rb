require 'spec_helper'

feature "Basic Visit" do
	let(:user) { Factory(:user) }

	before do
		user.confirm!
	end

	scenario "Getting a Meal" do
		visit "/"

		click_link 'Sign in'
		fill_in 'Email', :with => user.email
		fill_in 'Password', :with => "password"

		click_button "Sign in"
		page.should have_content("Hi there, #{user.email}!")

		check "user_medium"
		click_button "Get a Meal"
		Page.should have_content("Carrots! *sparkledust*")
	end
end


