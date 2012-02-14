Given /^I have no profile_affiliations$/ do
  ProfileAffiliation.delete_all
end


Then /^I should have ([0-9]+) profile_affiliations?$/ do |count|
  ProfileAffiliation.count.should == count.to_i
end
