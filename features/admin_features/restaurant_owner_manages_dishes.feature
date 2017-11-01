Feature: Restaurant owner can edit a dish
  As a Restaurant owner
  In order to update a restaurant
  I  would like to be able to update the dish

  Background:
    Given The following admins exist
      | email                    | password | super_admin |
      | mythai_owner@example.com | password | no          |
      | mymex_owner@example.com  | password | no          |

    And the following restaurants with associations exist
      | name    | address   | description         | res_category_name | menu_name | restaurant_owner         |
      | My Thai | Stockholm | Some hip thai place | Thai              | Lunch     | mythai_owner@example.com |
      | My Mex  | Stockholm | Mexican tacos       | Mexican           | Dinner    | mymex_owner@example.com  |

    Given the following dishes exists
      | name        | description         | price | image    | dish_category | menu_name | restaurant |
      | Sushi rolls | Tasty Japanese food | 10    | kfc.jpeg | Main          | Lunch     | My Thai    |
      | Dumplings   | Tasty Japanese food | 15    | kfc.jpeg | Main          | Lunch     | My Thai    |
      | Tacos       | Tasty Mexican food  | 12    | kfc.jpeg | Main          | Dinner    | My Mex     |

    And I am logged in to AA as "mythai_owner@example.com"
    And I go to the dashboard

  Scenario: My Thai adds new dish
    Given I click "Dishes"
    Then I click "New Dish"
    And I fill in "Name" with "Sushi"
    And I fill in "Description" with "I really cant come up with some boring description"
    And I fill in "Price" with "23"
    And I add "dish" "kfc.jpeg"
    And I select "My Thai" from dish dropdown
    And I select "Lunch" from menu line list
    And I select "Main" from dish category dropdown
    Then I click "Create Dish"
    And I should see "Dish was successfully created."

  Scenario: My Thai updates dish
    Given I click "Dishes"
    Then I click "Edit" for "Sushi rolls" dish
    And I fill in "Name" with "Sushi sticks"
    And I fill in "Description" with "To many descriptions to fill out"
    And I select "Main" from dish category dropdown
    When I click "Update Dish"
    Then I should see "Dish was successfully updated."

  @javascript
  Scenario: My Thai deletes dish
    Given I click "Dishes"
    When I click "Delete" for "Sushi rolls" dish
#    And I click ok on alert box
    Then I should see "Dish was successfully destroyed."

  Scenario: My Thai owner cant see My Mex dishes
    Given I click "Dishes"
    Then I should not see "Tacos"