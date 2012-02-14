@profile_urls
Feature: Profile Urls
  In order to have profile_urls on my website
  As an administrator
  I want to manage profile_urls

  Background:
    Given I am a logged in refinery user
    And I have no profile_urls

  @profile_urls-list @list
  Scenario: Profile Urls List
   Given I have profile_urls titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of profile_urls
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @profile_urls-valid @valid
  Scenario: Create Valid Profile Url
    When I go to the list of profile_urls
    And I follow "Add New Profile Url"
    And I fill in "Content" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 profile_url

  @profile_urls-invalid @invalid
  Scenario: Create Invalid Profile Url (without content)
    When I go to the list of profile_urls
    And I follow "Add New Profile Url"
    And I press "Save"
    Then I should see "Content can't be blank"
    And I should have 0 profile_urls

  @profile_urls-edit @edit
  Scenario: Edit Existing Profile Url
    Given I have profile_urls titled "A content"
    When I go to the list of profile_urls
    And I follow "Edit this profile_url" within ".actions"
    Then I fill in "Content" with "A different content"
    And I press "Save"
    Then I should see "'A different content' was successfully updated."
    And I should be on the list of profile_urls
    And I should not see "A content"

  @profile_urls-duplicate @duplicate
  Scenario: Create Duplicate Profile Url
    Given I only have profile_urls titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of profile_urls
    And I follow "Add New Profile Url"
    And I fill in "Content" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 profile_urls

  @profile_urls-delete @delete
  Scenario: Delete Profile Url
    Given I only have profile_urls titled UniqueTitleOne
    When I go to the list of profile_urls
    And I follow "Remove this profile url forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 profile_urls
 