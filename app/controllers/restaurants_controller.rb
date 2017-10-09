class RestaurantsController < ApplicationController
  before_action :find_cart

  def index
    @categories = RestaurantCategory.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @dishes = Dish.all
    @category = DishCategory.all
    if params[:dish_category_id].present?
      @current_dish_category = DishCategory.find(params[:dish_category_id])
    end
  end
  
  def find_cart
    @cart = Cart.find(session[:cart_id]) if session[:cart_id]
  end
end
