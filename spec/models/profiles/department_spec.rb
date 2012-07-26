require 'spec_helper'

describe ProfileDepartment do

  def reset_profile_department(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @profile_department.destroy! if @profile_department
    @profile_department = ProfileDepartment.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_profile_department
  end

  context "validations" do
    
    it "rejects empty name" do
      ProfileDepartment.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_profile_department
      ProfileDepartment.new(@valid_attributes).should_not be_valid
    end
    
  end

end