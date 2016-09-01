@javascript
Feature: As a system user
  So that I can fill my menu with dishes
  I want to be able to create dishes

  Background:
    Given that following menus exist
      | name  |
      | lunch |
    And I am on the create dish page for menu "lunch"

  Scenario: Create a dish
    And I fill "Name" with "Dish Name"
    And I add a dish image
    And I fill "Price" with "3.00"
    And I fill "Description" with "My description"
    And I fill "Allergy info" with "Peanuts"
    And I fill "Ingredients" with "Mince"
    And I fill "Calories" with "429"
    And I select "Starter" from "Select the category for your dish"
    And I click "Create"
    Then I should be on the "dish show" page
    And I should see "Dish Name created successfully"

  Scenario: Reject when missing required values
    And I only fill in the optional fields
    And I click "Create"
    Then I should be on the "create dish" page
    And I should see "Name can't be blank"
    And I should see "Description can't be blank"
    And I should see "Price can't be blank"
