Then(/^I should see the input field "([^"]*)"$/) do |field|
  expect(page).to find_field field
end

Then(/^I should see the "([^"]*)" button$/) do |button|
  expect(page).to have_link_or_button button
end

Then(/^I should be on the "([^"]*)" page$/) do |expected_page|
  case expected_page
    when 'home' then
      path = root_path
    when 'create menu' then
      path = new_menu_path
    when 'signup' then
      path = new_user_registration_path
    when 'restaurants' then
      path = new_restaurant_path
    when 'create dish' then
      path = @menu ? new_menu_dish_path(@menu) : new_menu_dish_path(@restaurant.menus.first)
    when 'dashboard' then
      path = dashboard_path(@restaurant)
    when 'dish show' then
      @dish = @menu.dishes.last
      path = menu_dish_path(@menu, @dish)
    else
      raise 'You have not defined a path yet'
  end
  expect(page.current_path).to eq path
end


Given(/^that following menus exist$/) do |table|
  table.hashes.each do |menu|
    FactoryGirl.create(:menu, menu)
  end

  if @restaurant
    Menu.all.each do |menu|
      menu.update_attribute(:restaurant, @restaurant)
    end
  end
end


And(/^that following menus for "([^"]*)" exist$/) do |name, table|
  @restaurant = Restaurant.find_by(name: name)
  table.hashes.each do |menu|
    FactoryGirl.create(:menu, menu.merge!(restaurant: @restaurant))
  end
end
