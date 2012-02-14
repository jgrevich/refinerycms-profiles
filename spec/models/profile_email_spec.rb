require 'spec_helper'

describe ProfileEmail do

  def reset_profile_email(options = {})
    @valid_attributes = {
      :id => 1,
      :content => "RSpec is great for testing too"
    }

    @profile_email.destroy! if @profile_email
    @profile_email = ProfileEmail.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_profile_email
  end

  context "validations" do
    
    it "rejects empty content" do
      ProfileEmail.new(@valid_attributes.merge(:content => "")).should_not be_valid
    end

    it "rejects non unique content" do
      # as one gets created before each spec by reset_profile_email
      ProfileEmail.new(@valid_attributes).should_not be_valid
    end
    
  end

end