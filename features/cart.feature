Feature: Shopping Cart
  In order to manage items before purchase
  As a user of the iOS/macOS shopping app
  I want to add and remove items from my cart

  Scenario: Adding an item to the cart
    Given I open the app
    When I add an item to my cart
    Then the item should appear in the cart
    And the cart total should be updated accordingly