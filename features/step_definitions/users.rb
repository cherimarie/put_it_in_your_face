Given /^I am logged in$/ do
#  user   = FactoryGirl.create :user
#  visit '/users/sign_in'
#
#  fill_in "Email",    :with => user.email
#  fill_in "Password", :with => user.password
#
#  click_button "Sign in"
#  page.should have_content("You have signed up successfully.")

  user = Factory :user
  open_email user.email, :with_subject => /Confirmation/
  click_first_link_in_email
  page.should have_content("Your account was successfully confirmed")
  page.should have_content("You are now signed in.")
end
