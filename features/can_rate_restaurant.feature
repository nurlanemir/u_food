Feature: User can rate restaurant
  As a user
  In order to give my feedback
  I would like to be able to rate the restaurant

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
    Then I navigate to the index page
    And I see the navbar
    And I click "Japanese"
    And I click "Yappi"

  @javascript
  Scenario: User can rate restaurant on scale 1-5
    Given I click "Add Review"
    And I click "4" stars
    And I add comment "Decent restaurant"
    And I click "Create Review" button
    Then I should see the text "Decent restaurant"
    And the last rating for "Yappi" should be "4"
