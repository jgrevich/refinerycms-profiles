require 'spec_helper'

describe ProfileOrganization do

  def reset_profile_organization(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @profile_organization.destroy! if @profile_organization
    @profile_organization = ProfileOrganization.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_profile_organization
  end

  context "validations" do
    
    it "rejects empty name" do
      ProfileOrganization.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_profile_organization
      ProfileOrganization.new(@valid_attributes).should_not be_valid
    end
    
  end

end