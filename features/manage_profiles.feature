@profiles
Feature: Profiles
  In order to have profiles on my website
  As an administrator
  I want to manage profiles

  Background:
    Given I am a logged in refinery user
    And I have no profiles

  @profiles-list @list
  Scenario: Profiles List
   Given I have profiles titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of profiles
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @profiles-valid @valid
  Scenario: Create Valid Profile
    When I go to the list of profiles
    And I follow "Add New Profile"
    And I fill in "First Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 profile

  @profiles-invalid @invalid
  Scenario: Create Invalid Profile (without first_name)
    When I go to the list of profiles
    And I follow "Add New Profile"
    And I press "Save"
    Then I should see "First Name can't be blank"
    And I should have 0 profiles

  @profiles-edit @edit
  Scenario: Edit Existing Profile
    Given I have profiles titled "A first_name"
    When I go to the list of profiles
    And I follow "Edit this profile" within ".actions"
    Then I fill in "First Name" with "A different first_name"
    And I press "Save"
    Then I should see "'A different first_name' was successfully updated."
    And I should be on the list of profiles
    And I should not see "A first_name"

  @profiles-duplicate @duplicate
  Scenario: Create Duplicate Profile
    Given I only have profiles titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of profiles
    And I follow "Add New Profile"
    And I fill in "First Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 profiles

  @profiles-delete @delete
  Scenario: Delete Profile
    Given I only have profiles titled UniqueTitleOne
    When I go to the list of profiles
    And I follow "Remove this profile forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 profiles
 