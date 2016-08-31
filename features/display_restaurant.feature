Feature: As a visitor
  In order to see the offers of a restaurant and its ability to deliver to me
  I want to be able to see these details on a Restaurant page

  Background:
    Given the following restaurant exists
      | name         | description              | address            | phone_number | email_address |
      | Asia House   | Asian food at it\'s best | 411, 26 Gothenburg | 011 555 5555 | Asia@asia.com |

    And the following cusine for "Asia House" exsits
      | cuisine |
      | Asian   |

    And that following menus for "Asian" exist
      | name      |
      | Dinner    |

    And that following dishes for "Dinner" exist
      | name                   | ingredients                                   | allergy_info    | description                 | price | calories |
      | Asian Ribs             | Pork Back Ribs, Sesame Oil, Garlic            | Garlic          | Sticky and Yummy Asian Ribs |  85   | 450      |
      | Pork Belly and Noodles | Pork Belly, Red Miso Paste, Mung Bean Sprouts | None            | A tasty dish                |  70   | 350      |
      | Sticky sesame prawns   | King prawns, Red Chilli, Sesame Seeds         | Shell Fish      | Prawns and Asian flavours   |  95   | 200      |

  Scenario: Display restaurant details
    Given I am on the "show" page for restaurant: "Asia House"
    Then show me the page
    Then I should see "Asian food at it\'s best"
    And I should see "411, 26 Gothenburg"
    And I should see "011 555 5555"
    And I should see "Asian"
    And I should see "Dinner"
    And I should see "Asian Ribs"
    And I should see "Pork Back Ribs, Sesame Oil, Garlic"
    And I should see "Garlic"
    And I should see "Sticky and Yummy Asian Ribs"
    And I should see "85"
    And I should see "450"
