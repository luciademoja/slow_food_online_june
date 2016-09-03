Then(/^Show me the page$/) do
  save_and_open_page
end

Then(/^I should see the field "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Then(/^I should see all the fields$/) do
  steps %q{
   Then I should see the field "Name"
   Then I should see the field "Address"
   Then I should see the field "Zip code"
   Then I should see the field "Delivery radius"
   Then I should see the field "Phone number"
   Then I should see the field "Email address"
   Then I should see the field "Description"
   Then I should see the field "Select your cuisine"
 }
end

Then(/^I should see a "([^"]*)" button$/) do |button|
  expect(page).to have_button button
end

Then(/^I click on the "([^"]*)" button$/) do |button|
  click_link_or_button button
end

Then(/^the "([^"]*)" drop\-down should contain the option "([^"]*)"$/) do |id, value|
  select(value, from: id)
end


And(/^I select "([^"]*)" from "([^"]*)"$/) do |option, select_field|
  select option, from: select_field
end

Then(/^I should see:$/) do |table|
  table.hashes.each do |hash|
    expect(page).to have_content hash[:message]
  end
end

Given(/^I have a restaurant called "([^"]*)"$/) do |name|
  @restaurant = FactoryGirl.create(:restaurant, name: name, user: @user)
end

# Given(/^the following cuisine for "([^"]*)" exsits$/) do |name, table|
#   @restaurant = Restaurant.find_by(name: name)
#   @restaurant.cuisines.each {|d| d.destroy}
#
#   table.hashes.each do |cuisine|
#     FactoryGirl.create(:cuisine, cuisine.merge!(restaurant: @restaurant))
#   end
# end
#
Given(/^I am on the "([^"]*)" page for restaurant: "([^"]*)"$/) do |page, name|
  @restaurant = Restaurant.find_by(name: name)
  case page
    when 'display'
        restaurant_path(@restaurant)
  end
end
