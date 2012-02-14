require 'spec_helper'

describe ProfileTitle do

  def reset_profile_title(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @profile_title.destroy! if @profile_title
    @profile_title = ProfileTitle.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_profile_title
  end

  context "validations" do
    
    it "rejects empty name" do
      ProfileTitle.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_profile_title
      ProfileTitle.new(@valid_attributes).should_not be_valid
    end
    
  end

end