Feature: Promotions
  In order to increase sales and customer engagement
  As a user of the iOS/macOS shopping app
  I want to view and apply promotions when purchasing items

  Scenario: Viewing available promotions
    Given I open the app
    When I navigate to the promotions section
    Then I should see a list of current promotions
    And each promotion should display its discount details

  Scenario: Applying a promotion to an item
    Given I have an item in my cart
    And a promotion is available for that item
    When I apply the promotion
    Then the item price should be reduced accordingly
    And the cart total should reflect the discount

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
    And a warning is shown that promotions cannot be applied for the next 24 hours

  Scenario: Applying multiple promotions to a single item
    Given I have an item in my cart
    And multiple promotions are available for that item
    When I apply the first promotion
    And I attempt to apply a second promotion
    Then the item price should reflect only the promotion with greater discount
    And a message should indicate that multiple promotions cannot be combined
    And the cart total should be updated accordingly

  Scenario: Restrict reapplying a removed promotion to another item within 1 hour
    Given I have an item in my cart
    And a promotion is available for that item
    When I apply the promotion
    And I remove the promotion from the item
    And I add a different item to my cart
    And I try to apply the same promotion to the new item within 1 hour
    Then the promotion should not be applied
    And a message should indicate that the promotion can only be reapplied after 1 hour