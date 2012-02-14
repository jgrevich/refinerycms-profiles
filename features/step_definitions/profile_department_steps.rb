Given /^I have no profile_departments$/ do
  ProfileDepartment.delete_all
end

Given /^I (only )?have profile_departments titled "?([^\"]*)"?$/ do |only, titles|
  ProfileDepartment.delete_all if only
  titles.split(', ').each do |title|
    ProfileDepartment.create(:name => title)
  end
end

Then /^I should have ([0-9]+) profile_departments?$/ do |count|
  ProfileDepartment.count.should == count.to_i
end
