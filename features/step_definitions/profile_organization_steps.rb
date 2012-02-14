Given /^I have no profile_organizations$/ do
  ProfileOrganization.delete_all
end

Given /^I (only )?have profile_organizations titled "?([^\"]*)"?$/ do |only, titles|
  ProfileOrganization.delete_all if only
  titles.split(', ').each do |title|
    ProfileOrganization.create(:name => title)
  end
end

Then /^I should have ([0-9]+) profile_organizations?$/ do |count|
  ProfileOrganization.count.should == count.to_i
end
