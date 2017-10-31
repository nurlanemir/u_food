Given("the following restaurants exist") do |table|
  table.hashes.each do |hash|
    res_category = RestaurantCategory.find_by(name: hash[:restaurant_category])
    file = File.new(Rails.root + "spec/fixtures/#{hash[:image]}")
    hash.except!('restaurant_category', 'image')
    restaurant = FactoryGirl.create(:restaurant, hash)
    restaurant.update_attributes(image: file, restaurant_category: res_category)
  end
end


And(/^I should see "([^"]*)" image$/) do |file_name|
  expect(page).to have_css("img[src*='#{file_name}']")
end