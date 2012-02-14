@profile_titles
Feature: Profile Titles
  In order to have profile_titles on my website
  As an administrator
  I want to manage profile_titles

  Background:
    Given I am a logged in refinery user
    And I have no profile_titles

  @profile_titles-list @list
  Scenario: Profile Titles List
   Given I have profile_titles titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of profile_titles
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @profile_titles-valid @valid
  Scenario: Create Valid Profile Title
    When I go to the list of profile_titles
    And I follow "Add New Profile Title"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 profile_title

  @profile_titles-invalid @invalid
  Scenario: Create Invalid Profile Title (without name)
    When I go to the list of profile_titles
    And I follow "Add New Profile Title"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 profile_titles

  @profile_titles-edit @edit
  Scenario: Edit Existing Profile Title
    Given I have profile_titles titled "A name"
    When I go to the list of profile_titles
    And I follow "Edit this profile_title" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of profile_titles
    And I should not see "A name"

  @profile_titles-duplicate @duplicate
  Scenario: Create Duplicate Profile Title
    Given I only have profile_titles titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of profile_titles
    And I follow "Add New Profile Title"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 profile_titles

  @profile_titles-delete @delete
  Scenario: Delete Profile Title
    Given I only have profile_titles titled UniqueTitleOne
    When I go to the list of profile_titles
    And I follow "Remove this profile title forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 profile_titles
 