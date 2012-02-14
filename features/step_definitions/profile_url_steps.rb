Given /^I have no profile_urls$/ do
  ProfileUrl.delete_all
end

Given /^I (only )?have profile_urls titled "?([^\"]*)"?$/ do |only, titles|
  ProfileUrl.delete_all if only
  titles.split(', ').each do |title|
    ProfileUrl.create(:content => title)
  end
end

Then /^I should have ([0-9]+) profile_urls?$/ do |count|
  ProfileUrl.count.should == count.to_i
end
