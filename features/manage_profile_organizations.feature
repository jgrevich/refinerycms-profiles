@profile_organizations
Feature: Profile Organizations
  In order to have profile_organizations on my website
  As an administrator
  I want to manage profile_organizations

  Background:
    Given I am a logged in refinery user
    And I have no profile_organizations

  @profile_organizations-list @list
  Scenario: Profile Organizations List
   Given I have profile_organizations titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of profile_organizations
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @profile_organizations-valid @valid
  Scenario: Create Valid Profile Organization
    When I go to the list of profile_organizations
    And I follow "Add New Profile Organization"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 profile_organization

  @profile_organizations-invalid @invalid
  Scenario: Create Invalid Profile Organization (without name)
    When I go to the list of profile_organizations
    And I follow "Add New Profile Organization"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 profile_organizations

  @profile_organizations-edit @edit
  Scenario: Edit Existing Profile Organization
    Given I have profile_organizations titled "A name"
    When I go to the list of profile_organizations
    And I follow "Edit this profile_organization" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of profile_organizations
    And I should not see "A name"

  @profile_organizations-duplicate @duplicate
  Scenario: Create Duplicate Profile Organization
    Given I only have profile_organizations titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of profile_organizations
    And I follow "Add New Profile Organization"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 profile_organizations

  @profile_organizations-delete @delete
  Scenario: Delete Profile Organization
    Given I only have profile_organizations titled UniqueTitleOne
    When I go to the list of profile_organizations
    And I follow "Remove this profile organization forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 profile_organizations
 