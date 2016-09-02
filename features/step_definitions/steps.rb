Given(/^I am on the "([^"]*)" page$/) do |pagename|
  visit path(pagename)
end

Then(/^show me the page$/) do
  save_and_open_page
end

Given(/^I navigate to the "([^"]*)" page$/) do |pagename|
  visit path(pagename)
end

Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in field, with: value
end


Given(/^I am logged in as a user of the system$/) do
  @user = FactoryGirl.create(:user)
  login_as @user
end

Then(/^show me an image of the page$/) do
  sleep(0.1) until page.evaluate_script('$.active') == 0
  Capybara::Screenshot.screenshot_and_open_image
end

private

def path(pagename)
  case pagename
    when 'home'
      root_path
    when 'restaurants'
      new_restaurant_path
    when 'signup'
      new_user_registration_path
    when 'create menu'
      new_menu_path
    when 'create dish'
      new_dish_path
    when 'shopping cart'
      cart_path
    when 'dashboard'
      dashboard_path(@restaurant)
    else
      raise 'You have not defined a path yet'
  end
end


Given(/^I am logged out$/) do
  logout
end
