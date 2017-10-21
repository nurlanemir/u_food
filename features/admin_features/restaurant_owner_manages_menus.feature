Feature: Restaurant owner can edit his menu
  As a Restaurant owner
  In order to update a restaurant
  I  would like to be able to update his menus

  Background:
    Given The following admins exist
      | email                    | password | super_admin |
      | mythai_owner@example.com | password | no          |
      | mymex_owner@example.com  | password | no          |

    And the following restaurants with associations exist
      | name    | address   | description         | res_category_name | menu_name | restaurant_owner         |
      | My Thai | Stockholm | Some hip thai place | Thai              | Lunch     | mythai_owner@example.com |
      | My Mex  | Stockholm | Mexican tacos       | Mexican           | Lunch     | mymex_owner@example.com  |

    And I am logged in to AA as "mythai_owner@example.com"
    And I go to the dashboard

  Scenario: My Thai owner adds new menu
    Given I click "Menus"
    Then I click "New Menu"
    And I fill in "Name" with "Breakfast"
    And I select "My Thai" from menu category dropdown
    Then I click "Create Menu"
    And I should see "Menu was successfully created."

  Scenario: My Thai owner updates menu
    Given I click "Menus"
    Then I click "Edit" for "Lunch" menu
    And I fill in "Name" with "Brunch"
    And I select "My Thai" from menu category dropdown
    When I click "Update Menu"
    Then I should see "Menu was successfully updated."

  @javascript
  Scenario: My Thai owner deletes menu
    Given I click "Menus"
    Then I click "Delete" for "Lunch" menu
#    And I click ok on alert box
    Then I should see "Menu was successfully destroyed."

  Scenario: My Thai owner cannot see restaurants he does not own
    Given I click "Menus"
    Then I should not see "My Mex"

  Scenario: My Mex owner updates menu
    Given I click "Menus"
    Then I click "Delete" for "Lunch" menu
    And restaurant owner logs out
    Then I am logged in to AA as "mymex_owner@example.com"
    And I click "Menus"
    Then I click "Edit" for "Lunch" menu
    And I fill in "Name" with "Brunch"
    And I select "My Mex" from menu category dropdown
    When I click "Update Menu"
    Then I should see "Menu was successfully updated."