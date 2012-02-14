@profile_departments
Feature: Profile Departments
  In order to have profile_departments on my website
  As an administrator
  I want to manage profile_departments

  Background:
    Given I am a logged in refinery user
    And I have no profile_departments

  @profile_departments-list @list
  Scenario: Profile Departments List
   Given I have profile_departments titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of profile_departments
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @profile_departments-valid @valid
  Scenario: Create Valid Profile Department
    When I go to the list of profile_departments
    And I follow "Add New Profile Department"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 profile_department

  @profile_departments-invalid @invalid
  Scenario: Create Invalid Profile Department (without name)
    When I go to the list of profile_departments
    And I follow "Add New Profile Department"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 profile_departments

  @profile_departments-edit @edit
  Scenario: Edit Existing Profile Department
    Given I have profile_departments titled "A name"
    When I go to the list of profile_departments
    And I follow "Edit this profile_department" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of profile_departments
    And I should not see "A name"

  @profile_departments-duplicate @duplicate
  Scenario: Create Duplicate Profile Department
    Given I only have profile_departments titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of profile_departments
    And I follow "Add New Profile Department"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 profile_departments

  @profile_departments-delete @delete
  Scenario: Delete Profile Department
    Given I only have profile_departments titled UniqueTitleOne
    When I go to the list of profile_departments
    And I follow "Remove this profile department forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 profile_departments
 