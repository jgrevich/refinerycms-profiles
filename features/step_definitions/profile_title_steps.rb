Given /^I have no profile_titles$/ do
  ProfileTitle.delete_all
end

Given /^I (only )?have profile_titles titled "?([^\"]*)"?$/ do |only, titles|
  ProfileTitle.delete_all if only
  titles.split(', ').each do |title|
    ProfileTitle.create(:name => title)
  end
end

Then /^I should have ([0-9]+) profile_titles?$/ do |count|
  ProfileTitle.count.should == count.to_i
end
