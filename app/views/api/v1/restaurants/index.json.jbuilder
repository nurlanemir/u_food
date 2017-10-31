json.data do
  json.restaurants @restaurants do |restaurant|
  json.name restaurant.name
  json.address restaurant.address
  json.description restaurant.description
  end
end
