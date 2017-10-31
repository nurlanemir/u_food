json.data do
  json.restaurants @restaurants do |restaurant|
    json.restaurant_name restaurant.name
    json.restaurant_address restaurant.address
    json.restaurant_description restaurant.description
    json.restaurant_latitude restaurant.latitude
    json.restaurant_longitude restaurant.longitude
    json.restaurant_categories @categories do |category|
      if restaurant.restaurant_category_id == category.id
        json.restaurant_category_name category.name
        json.restaurant_category_description category.description
      end
    end
  end
end