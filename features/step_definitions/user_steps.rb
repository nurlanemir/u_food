Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |item, content|
  fill_in item, with: content
end

Given("the following user exists") do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:user, hash)
  end
end