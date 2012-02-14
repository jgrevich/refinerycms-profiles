require 'spec_helper'

describe Profile do

  def reset_profile(options = {})
    @valid_attributes = {
      :id => 1,
      :first_name => "RSpec is great for testing too"
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

    it "rejects non unique first_name" do
      # as one gets created before each spec by reset_profile
      Profile.new(@valid_attributes).should_not be_valid
    end
    
  end

end