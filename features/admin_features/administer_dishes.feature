Feature: Admin can administer dishes
  As admin
  I order to maintain dishes
  I would like to be able to create, read, update and delete dishes

  Background:
    Given the following dishes exists
      | name        | description         | price | pic_url               | dish_category |menu_name    |
      | Sushi rolls | Tasty Japanese food | 10    | https://goo.gl/fH7P5F | Main          |Lunch        |
      | Dumplings   | Tasty Japanese food | 15    | https://goo.gl/qKCyL5 | Main          |Lunch        |
    And The following admins exist
      | email                        | password | super_admin |
      | admin@example.com            | password | yes         |
    And I am logged in to AA as "admin@example.com"
    And I go to the dashboard

  Scenario: Admin adds new dish
    Given I click "Dishes"
    Then I click "New Dish"
    And I fill in "Name" with "Sushi"
    And I fill in "Description" with "I really cant come up with some boring description"
    And I fill in "Price" with "23"
    And I fill in "Picture URL" with "https://goo.gl/qKCyL5"
    And I select "Main" from dish category dropdown
    Then I click "Create Dish"
    And I should see "Dish was successfully created."

  Scenario: Admin updates dish
    Given I click "Dishes"
    Then I click "Edit" for "Sushi rolls" dish
    And I fill in "Name" with "Sushi sticks"
    And I fill in "Description" with "To many descriptions to fill out"
    And I select "Main" from dish category dropdown
    When I click "Update Dish"
    Then I should see "Dish was successfully updated."

  @javascript
  Scenario: Admin deletes dish
    Given I click "Dishes"
    When I click "Delete" for "Sushi rolls" dish
#    And I click ok on alert box
    Then I should see "Dish was successfully destroyed."

  Scenario: Admin adds new dish category
    Given I click "Dish Categories"
    Then I click "New Dish Category"
    And I fill in "Name" with "Brunch"
    Then I click "Create Dish category"
    And I should see "Dish category was successfully created."

  Scenario: Admin edits dish category
    Given I click "Dish Categories"
    Then I click "Edit" for "Main" dish category
    And I fill in "Name" with "Starter"
    When I click "Update Dish category"
    Then I should see "Dish category was successfully updated."

  @javascript
  Scenario: Admin deletes dish category
    Given I click "Dish Categories"
    Then I click "Delete" for "Main" dish category
#    And I click ok on alert box
    Then I should see "Dish category was successfully destroyed."