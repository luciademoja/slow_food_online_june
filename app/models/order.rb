class Order < ApplicationRecord
  acts_as_shopping_cart_using :order_item

  belongs_to :user
end
