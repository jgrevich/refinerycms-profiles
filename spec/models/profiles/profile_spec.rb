require 'spec_helper'

describe Profile do

  def reset_profile(options = {})
    @valid_attributes = {
      :id => 1,
      :first_name => "Just",
      :last_name => "Testing"
    }

    @profile.destroy! if @profile
    @profile = Profile.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_profile
  end

  context "validations" do
    
    it "rejects empty first_name" do
      Profile.new(@valid_attributes.merge(:first_name => "")).should_not be_valid
    end

    it "rejects empty last_name" do
      Profile.new(@valid_attributes.merge(:last_name => "")).should_not be_valid
    end

    it "accepts first_name and last_name" do
      # as one gets created before each spec by reset_profile
      Profile.new(@valid_attributes).should be_valid
    end
    
  end

end