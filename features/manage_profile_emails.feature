@profile_emails
Feature: Profile Emails
  In order to have profile_emails on my website
  As an administrator
  I want to manage profile_emails

  Background:
    Given I am a logged in refinery user
    And I have no profile_emails

  @profile_emails-list @list
  Scenario: Profile Emails List
   Given I have profile_emails titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of profile_emails
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @profile_emails-valid @valid
  Scenario: Create Valid Profile Email
    When I go to the list of profile_emails
    And I follow "Add New Profile Email"
    And I fill in "Content" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 profile_email

  @profile_emails-invalid @invalid
  Scenario: Create Invalid Profile Email (without content)
    When I go to the list of profile_emails
    And I follow "Add New Profile Email"
    And I press "Save"
    Then I should see "Content can't be blank"
    And I should have 0 profile_emails

  @profile_emails-edit @edit
  Scenario: Edit Existing Profile Email
    Given I have profile_emails titled "A content"
    When I go to the list of profile_emails
    And I follow "Edit this profile_email" within ".actions"
    Then I fill in "Content" with "A different content"
    And I press "Save"
    Then I should see "'A different content' was successfully updated."
    And I should be on the list of profile_emails
    And I should not see "A content"

  @profile_emails-duplicate @duplicate
  Scenario: Create Duplicate Profile Email
    Given I only have profile_emails titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of profile_emails
    And I follow "Add New Profile Email"
    And I fill in "Content" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 profile_emails

  @profile_emails-delete @delete
  Scenario: Delete Profile Email
    Given I only have profile_emails titled UniqueTitleOne
    When I go to the list of profile_emails
    And I follow "Remove this profile email forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 profile_emails
 