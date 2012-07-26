require 'spec_helper'

describe ProfileUrl do

  def reset_profile_url(options = {})
    @valid_attributes = {
      :id => 1,
      :content => "RSpec is great for testing too"
    }

    @profile_url.destroy! if @profile_url
    @profile_url = ProfileUrl.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_profile_url
  end

  context "validations" do
    
    it "rejects empty content" do
      ProfileUrl.new(@valid_attributes.merge(:content => "")).should_not be_valid
    end

    it "rejects non unique content" do
      # as one gets created before each spec by reset_profile_url
      ProfileUrl.new(@valid_attributes).should_not be_valid
    end
    
  end

end