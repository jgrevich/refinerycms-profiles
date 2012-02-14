Given /^I have no profile_emails$/ do
  ProfileEmail.delete_all
end

Given /^I (only )?have profile_emails titled "?([^\"]*)"?$/ do |only, titles|
  ProfileEmail.delete_all if only
  titles.split(', ').each do |title|
    ProfileEmail.create(:content => title)
  end
end

Then /^I should have ([0-9]+) profile_emails?$/ do |count|
  ProfileEmail.count.should == count.to_i
end
