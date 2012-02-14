Given /^I have no profile_phones$/ do
  ProfilePhone.delete_all
end

Given /^I (only )?have profile_phones titled "?([^\"]*)"?$/ do |only, titles|
  ProfilePhone.delete_all if only
  titles.split(', ').each do |title|
    ProfilePhone.create(:number => title)
  end
end

Then /^I should have ([0-9]+) profile_phones?$/ do |count|
  ProfilePhone.count.should == count.to_i
end
