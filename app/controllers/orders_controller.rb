class OrdersController < ApplicationController


  def add_to_order
    dish = Dish.find(params[:dish_id])
    order = Order.find_or_create_by(user: current_user)
    order.add(dish, dish.price)
    flash[:notice] = "#{dish.name} has been added to your order"
    redirect_back(fallback_location: root_path)
  end

end
