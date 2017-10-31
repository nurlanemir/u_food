Given('the following dishes exists') do |table|
  table.hashes.each do |hash|
    category = find_or_create_dish_category(hash)
    menu = Menu.find_by(name: hash[:menu_name])
    restaurant = Restaurant.find_by(name: hash[:restaurant])
    hash.except!('dish_category', 'menu_name', 'restaurant')
    dish = FactoryGirl.create(:dish, hash.merge(dish_category: category))
    FactoryGirl.create(:menu_line, menu: menu, dish: dish)
    dish.update(restaurant: restaurant)
  end
end

Given('the following dish category exists') do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:dish_category, hash)
  end
end

Given('the following restaurants with associations exist') do |table|
  table.hashes.each do |hash|
    file = File.new(Rails.root + "spec/fixtures/#{hash[:image]}") if hash[:image]
    hash.except!('image')
    if hash[:restaurant_owner]
      restaurant_owner = AdminUser.find_by(email: hash[:restaurant_owner])
      hash.except!('restaurant_owner')
    end
    restaurant = FactoryGirl.create(:restaurant_with_associations, hash)
    restaurant.update(admin_user: restaurant_owner) unless restaurant_owner.nil?
    restaurant.update_attributes(image: file) if file
  end
end

And(/^show me the page$/) do
  save_and_open_page
end
