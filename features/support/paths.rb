module NavigationHelpers
  module Refinery
    module Profiles
      def path_to(page_name)
        case page_name
        when /the list of profiles/
          admin_profiles_path

         when /the new profile form/
          new_admin_profile_path
        when /the list of emails/
          admin_emails_path

         when /the new email form/
          new_admin_email_path
        when /the list of emails/
          admin_emails_path

         when /the new email form/
          new_admin_email_path
        when /the list of emails/
          admin_emails_path

         when /the new email form/
          new_admin_email_path
        when /the list of emails/
          admin_emails_path

         when /the new email form/
          new_admin_email_path
        when /the list of profile_phones/
          admin_profile_phones_path

         when /the new profile_phone form/
          new_admin_profile_phone_path
        when /the list of profile_emails/
          admin_profile_emails_path

         when /the new profile_email form/
          new_admin_profile_email_path
        when /the list of profile_urls/
          admin_profile_urls_path

         when /the new profile_url form/
          new_admin_profile_url_path
        when /the list of profile_affiliations/
          admin_profile_affiliations_path

         when /the new profile_affiliation form/
          new_admin_profile_affiliation_path
        when /the list of profile_titles/
          admin_profile_titles_path

         when /the new profile_title form/
          new_admin_profile_title_path
        when /the list of profile_departments/
          admin_profile_departments_path

         when /the new profile_department form/
          new_admin_profile_department_path
        when /the list of profile_organizations/
          admin_profile_organizations_path

         when /the new profile_organization form/
          new_admin_profile_organization_path
        else
          nil
        end
      end
    end
  end
end
