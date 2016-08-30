Feature: As a System user
  In order to make it easier to select a dish
  I want to be able to create a full presentation of the dish


  Background:
    Given I am logged in as a user of the system

    And the following restaurant exists
      | name       |
      | Salvatores |

    And that following menus for "Salvatores" exist
      | name  |
      | lunch |

    And that following dishes for "lunch" exist
      | name        | price | calories | ingredients                      | allergy_info    | description                             |
      | Capricciosa | 50    |          |                                  |                 | Delicious pizza...                      |
      | Margharita  | 50    | 1000     |                                  |                 | Delicious pizza...                      |
      | Bolognese   | 50    | 1000     | Tomato,Cheese, Sausage           |                 | Delicious pizza...                      |
      | Vesuvio     | 50    | 1000     | Tomato, Cheese, Ham              | Gluten, Lactose | Delicious pizza...                      |
      | Marinara    | 60    | 1000     | Tomato, Cheese, Shrimps, Mussels | Gluten, Lactose | Delicious pizza with fruits of the sea! |

  Scenario: Add Capricciosa to my order
    Given I am on the "show" page for dish: "Capricciosa"
    And I click on "Order"
    Then "Capricciosa" should be added to my order
    And I should see "Capricciosa has been added to your order"

  Scenario: Add Capricciosa and Margharita to my order
    Given I am on the "show" page for dish: "Capricciosa"
    And I click on "Order"
    Given I am on the "show" page for dish: "Margharita"
    And I click on "Order"
    Then I should have "2" items in my order
    And the subtotal should be "100"

  Scenario: Add 2 Capricciosa and Bolognese to my order
    Given I am on the "show" page for dish: "Capricciosa"
    And I click on "Order"
    And I click on "Order"
    Given I am on the "show" page for dish: "Margharita"
    And I click on "Order"
    Then I should have "3" items in my order
    And the subtotal should be "150"
