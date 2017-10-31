Feature: Admin can administer restaurants
  As admin
  I order to add maintain restaurants
  I would like to be able to create, read, update and delete restaurants

  Background:
    Given the following restaurants with associations exist
      | name    | address   | description         | res_category_name | menu_name | image           |
      | My Thai | Stockholm | Some hip thai place | Thai              | Lunch     | restaurant.jpeg |
      | My Mex  | Stockholm | Mexican tacos       | Mexican           | Lunch     | restaurant.jpeg |

    And The following admins exist
      | email             | password | super_admin |
      | admin@example.com | password | yes         |

    And I am logged in to AA as "admin@example.com"
    And I go to the dashboard

  Scenario: Admin adds new restaurant
    Given I click "Restaurants"
    Then I click "New Restaurant"
    And I fill in "Name" with "The New Thai Restaurant"
    And I fill in "Address" with "Street 1"
    And I fill in "Description" with "I really cant come up with some boring description"
    And I add "restaurant" "restaurant.jpeg"
    And I select "Thai" from restaurant category dropdown
    Then I click "Create Restaurant"
    And I should see "Restaurant was successfully created."
    And I should see "restaurant.jpeg" image
    And I should see the text "The New Thai Restaurant"
    And I should see the text "Street 1"
    And I should see the text "I really cant come up with some boring description"

  Scenario: Admin updates restaurant
    Given I click "Restaurants"
    When I click "Edit" for "My Thai" restaurant
    And I fill in "Name" with "The Old Thai Restaurant"
    And I fill in "Address" with "Street 78"
    And I fill in "Description" with "To many descriptions to fill out"
    And I select "Mexican" from restaurant category dropdown
    When I click "Update Restaurant"
    Then I should see "Restaurant was successfully updated."

  @javascript
  Scenario: Admin deletes restaurant
    Given I click "Restaurants"
    When I click "Delete" for "My Thai" restaurant
#    And I click ok on alert box
    Then I should see "Restaurant was successfully destroyed."

  Scenario: Admin adds new restaurant category
    Given I click "Restaurant Categories"
    Then I click "New Restaurant Category"
    And I fill in "Name" with "Swedish"
    And I fill in "Description" with "Swedish Delicatesse"
    Then I click "Create Restaurant category"
    And I should see "Restaurant category was successfully created."

  Scenario: Admin edits restaurant category
    Given I click "Restaurant Categories"
    Then I click "Edit" for "Thai" restaurant category
    And I fill in "Name" with "Chinese"
    And I fill in "Description" with "Chinese food"
    When I click "Update Restaurant category"
    Then I should see "Restaurant category was successfully updated."