Given(/^I only fill in the optional fields$/) do
  steps %q{
  And I fill "Allergy info" with "Peanuts"
  And I fill "Ingredients" with "Mince"
  And I fill "Calories" with "429"
  }
end

And(/^I am on the create dish page for menu "([^"]*)"$/) do |name|
  @menu = Menu.find_by(name: name)
  visit new_menu_dish_path(@menu)
end


And(/^that following dishes for "([^"]*)" exist$/) do |name, table|
  @menu = Menu.find_by(name: name)
  @menu.dishes.each {|d| d.destroy}

  table.hashes.each do |dish|
    FactoryGirl.create(:dish, dish.merge!(menu: @menu))
  end
end

Given(/^I am on the "([^"]*)" page for dish: "([^"]*)"$/) do |page, name|
  @dish = Dish.find_by(name: name, menu: @menu)
  case page
    when 'show'
      visit menu_dish_path(@menu, @dish)
  end
end

And(/^I add a dish image$/) do
  attach_file('dish_image', File.join(Rails.root, '/spec/fixtures/pizza-300x300.jpg'))
end

Then(/^I should see image "([^"]*)"$/) do |image|
  expect(page).to have_selector("img[src$='#{image}']")
end
