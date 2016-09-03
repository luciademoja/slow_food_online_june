class RestaurantsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :show]

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      flash[:success] = 'Information successfully updated'
      redirect_to root_path
    else
      set_flash_message(@restaurant)
      redirect_to action: :edit
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menu = @restaurant.menus.find_by(id: params[:id])
    # @dish = @menu.dishes.find_by(id: params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name,
                                       :address,
                                       :zip_code,
                                       :city,
                                       :delivery_radius,
                                       :phone_number,
                                       :email_address,
                                       :description,
                                       :cuisine)
  end

end
