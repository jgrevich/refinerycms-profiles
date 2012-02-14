Given /^I have no profiles$/ do
  Profile.delete_all
end

Given /^I (only )?have profiles titled "?([^\"]*)"?$/ do |only, titles|
  Profile.delete_all if only
  titles.split(', ').each do |title|
    Profile.create(:first_name => title)
  end
end

Then /^I should have ([0-9]+) profiles?$/ do |count|
  Profile.count.should == count.to_i
end
