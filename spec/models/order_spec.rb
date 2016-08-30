require 'rails_helper'

RSpec.describe Order, type: :model do

  it { is_expected.to respond_to :add }
  it { is_expected.to respond_to :items? }
  it { is_expected.to respond_to :total }
  it { is_expected.to respond_to :subtotal }
  it { is_expected.to respond_to :remove }
  it { is_expected.to respond_to :taxes }
  it { is_expected.to respond_to :clear }
  it { is_expected.to respond_to :quantity_for }
  it { is_expected.to respond_to :price_for }
  it { is_expected.to respond_to :update_quantity_for }

  it { is_expected.to respond_to :update_price_for }

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :shopping_cart_items }

  let!(:system_user) { FactoryGirl.create(:user) }
  let!(:visitor) { FactoryGirl.create(:user) }

  let!(:restaurant) { FactoryGirl.create(:restaurant, user: system_user) }

  let!(:menu) { FactoryGirl.create(:menu, restaurant: restaurant) }


  let!(:product_1) { FactoryGirl.create(:dish, price: 40, menu: menu) }
  let!(:product_2) { FactoryGirl.create(:dish, menu: menu) }
  let!(:product_3) { FactoryGirl.create(:dish, menu: menu) }


  it 'calculates subtotal' do
    order = visitor.orders.create
    order.add(product_1, product_1.price, 2)
    expect(order.subtotal.to_i).to eq (product_1.price * 2).to_i
  end

end
