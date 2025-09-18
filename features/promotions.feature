Feature: Promotions
  In order to increase sales and customer engagement
  As a user of the iOS/macOS shopping app
  I want to view and apply promotions when purchasing items

  Scenario: Viewing available promotions
    Given I open the app
    When I navigate to the promotions section
    Then I should see a list of current promotions
    And each promotion should display its discount details

Scenario: Applying an expired promotion
    Given I have an item in my cart
    And the promotion for that item has expired
    When I try to apply the promotion
    Then the item price should remain the same
    And a message should indicate that the promotion is no longer valid

Scenario: Applying a promotion not valid for the item
    Given I have an item in my cart
    And the promotion does not apply to this item
    When I attempt to apply the promotion
    Then the item price should remain unchanged
    And a message should indicate the promotion cannot be applied to this item