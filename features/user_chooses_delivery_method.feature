Feature: user can can add dish to order
  As a user
  In order to get food
  I would like to able to add dish to order

  Background:
    Given the following user exists
      | email               | encrypted_password |
      | example@example.com | password           |

    And the following user is signed in
      | email               | encrypted_password |
      | example@example.com | password           |

    Given the following restaurants with associations exist
      | name  | address   | description         | res_category_name | menu_name |
      | Yappi | Stockholm | Some hip thai place | Japanese          | Lunch     |

    And the following dishes exists
      | name        | description         | price | image    | dish_category | menu_name |
      | Sushi rolls | Tasty Japanese food | 10    | kfc.jpeg | Main          | Lunch     |
      | Dumplings   | Tasty Japanese food | 15    | kfc.jpeg | Main          | Lunch     |

    Then I navigate to the index page
    And I see the navbar
    And I click "Japanese"
    And I click "Yappi"
    And I click "Main"
    Then I should see the text "Sushi rolls"
    And I fill in field "amount" and id "Sushi rolls" with "1"
    And I click "Add to cart" within id "Sushi rolls"
    Then I should see the text "Sushi rolls added to cart: 1"
    And My order should contain "1" item
    And I click "1"
    Then I should see the text "1"
    And I should see the text "Sushi rolls"
    And I should see the text "Total items: 1"
    And I should see the text "Total cost: 10 $"

  Scenario: User can choose pickup
    Given I choose "delivery_pickup"
    And I click "Save"
    Then I should see the text "Total cost: 10 $"

  Scenario: User can choose delivery
    Given I choose "delivery_delivery"
    And I click "Save"
    Then I should see the text "Total cost: 15 $"

  Scenario: User can switch between options
    Given I choose "delivery_delivery"
    And I click "Save"
    Then I should see the text "Total cost: 15 $ You choose: delivery"
    When I choose "delivery_pickup"
    And I click "Save"
    Then I should see the text "Total cost: 10 $ You choose: pickup"

