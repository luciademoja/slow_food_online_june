Then(/^"([^"]*)" should be added to my order$/) do |dishname|

  @order = Order.find_or_create_by(user: @user)
  dish = Dish.find_by(name: dishname)
  condition = Proc.new {@order.shopping_cart_items.any? {|d| d.item_id == dish.id}}

  expect(condition.call).to eq true
end

Then(/^I should have "([^"]*)" items in my order$/) do |num|
  @order = Order.find_or_create_by(user: @user)
  total = 0
  @order.shopping_cart_items.each do |item|
    total += item.quantity
  end
  expect(total).to eq num.to_i
end

Then(/^the subtotal should be "([^"]*)"$/) do |sum|
  expect(@order.subtotal.to_i).to eq sum.to_i
end

Given(/^I have added items to my cart$/) do
  steps %q{
    Given I am on the "show" page for dish: "Capricciosa"
    And I click on "Order"
    And I click on "Order"
    Given I am on the "show" page for dish: "Margharita"
    And I click on "Order"
  }
end

Then(/^I should see a list of items$/) do
  pending # Write code here that turns the phrase above into concrete actions
end
