Feature: Sponsorship Level
  In order to test CRUD on sponsorship levels
  As a user
  I need to be able to list all levels and fill forms

  Scenario: I add a sponsorship level
    Given I am on "sponsorship-level/create"
    When I fill in "sponsorship_level[label]" with "Level 1"
    And I fill in "sponsorship_level[price]" with "100"
    And I press "Save"
    Then I should be on "sponsorship-level/"
    And I should see "Level 1"

  Scenario: I fill a string in price instead of a double when i add a sponsorship level
    Given I am on "sponsorship-level/create"
    When I fill in "sponsorship_level[label]" with "Level 1"
    And I fill in "sponsorship_level[price]" with "error"
    And I press "Save"
    Then I should see "This value is not valid."

  Scenario: I don't fill all data needed when i add a sponsorship level
    Given I am on "sponsorship-level/create"
    When I press "Save"
    Then I should see "This value should not be blank."

  Scenario: I fill a string in price instead of a double when i edit a sponsorship level "Level 1"
    Given I am on "sponsorship-level/"
    And I click "edit" on the row containing "Level 1"
    When I fill in "sponsorship_level[label]" with "Level 10"
    And I fill in "sponsorship_level[price]" with "error"
    And I press "Update"
    Then I should see "This value is not valid."

  Scenario: I don't fill all data needed when i edit a sponsorship level "Level 1"
    Given I am on "sponsorship-level/"
    And I click "edit" on the row containing "Level 1"
    When I fill in "sponsorship_level[label]" with ""
    And I fill in "sponsorship_level[price]" with ""
    And I press "Update"
    Then I should see "This value should not be blank."

  Scenario: I edit the sponsorship level "Level 1"
    Given I am on "sponsorship-level/"
    And I click "edit" on the row containing "Level 1"
    When I fill in "sponsorship_level[label]" with "Level 10"
    And I press "Update"
    Then I should be on "sponsorship-level/"
    And I should see "Level 10"

  @javascript
  Scenario: I delete the sponsorship level "Level 10"
    Given I am on "sponsorship-level/"
    When I press "Delete" on the row containing "Level 10" and cancel popup
    Then I should see "Level 10"

  @javascript
  Scenario: I delete the sponsorship level "Level 10"
    Given I am on "sponsorship-level/"
    When I press "Delete" on the row containing "Level 10" and confirm popup
    Then I should not see "Level 10"
