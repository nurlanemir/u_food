ActiveAdmin.register Dish do

  permit_params :name, :description, :price, :pic_url, :dish_category_id, :restaurant_id

end
