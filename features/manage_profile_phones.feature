@profile_phones
Feature: Profile Phones
  In order to have profile_phones on my website
  As an administrator
  I want to manage profile_phones

  Background:
    Given I am a logged in refinery user
    And I have no profile_phones

  @profile_phones-list @list
  Scenario: Profile Phones List
   Given I have profile_phones titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of profile_phones
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @profile_phones-valid @valid
  Scenario: Create Valid Profile Phone
    When I go to the list of profile_phones
    And I follow "Add New Profile Phone"
    And I fill in "Number" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 profile_phone

  @profile_phones-invalid @invalid
  Scenario: Create Invalid Profile Phone (without number)
    When I go to the list of profile_phones
    And I follow "Add New Profile Phone"
    And I press "Save"
    Then I should see "Number can't be blank"
    And I should have 0 profile_phones

  @profile_phones-edit @edit
  Scenario: Edit Existing Profile Phone
    Given I have profile_phones titled "A number"
    When I go to the list of profile_phones
    And I follow "Edit this profile_phone" within ".actions"
    Then I fill in "Number" with "A different number"
    And I press "Save"
    Then I should see "'A different number' was successfully updated."
    And I should be on the list of profile_phones
    And I should not see "A number"

  @profile_phones-duplicate @duplicate
  Scenario: Create Duplicate Profile Phone
    Given I only have profile_phones titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of profile_phones
    And I follow "Add New Profile Phone"
    And I fill in "Number" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 profile_phones

  @profile_phones-delete @delete
  Scenario: Delete Profile Phone
    Given I only have profile_phones titled UniqueTitleOne
    When I go to the list of profile_phones
    And I follow "Remove this profile phone forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 profile_phones
 