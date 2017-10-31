json.data do
  json.restaurant_categories @categories do |category|
    json.restaurant_category_name category.name
    json.restaurant_category_description category.description
    json.restaurants @restaurants do |restaurant|
      if restaurant.restaurant_category_id == category.id
        json.restaurant_name restaurant.name
        json.restaurant_address restaurant.address
        json.restaurant_decription restaurant.description
      end
    end
  end
end
