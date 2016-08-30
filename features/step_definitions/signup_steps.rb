Given(/^I click "([^"]*)"$/) do |link|
  click_link_or_button link
end

Given(/^I click on "([^"]*)"$/) do |button|
  click_link_or_button button
end

Given(/^there is a user with email "([^"]*)"$/) do |email|
  FactoryGirl.create(:user, email: email)
end

Given(/^I am logged in as "([^"]*)"$/) do |email|
  @user = User.find_by(email: email)
  login_as @user
end
