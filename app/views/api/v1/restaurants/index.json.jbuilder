json.restaurants @restaurants do |restaurant|
  json.id restaurant.id
  json.name restaurant.name
  json.address restaurant.address
  json.description restaurant.description
  json.latitude restaurant.latitude
  json.longitude restaurant.longitude
  json.category_name restaurant.restaurant_category.name
  json.category_description restaurant.restaurant_category.description
end