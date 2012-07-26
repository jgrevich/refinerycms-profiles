require 'spec_helper'

describe ProfilePhone do

  def reset_profile_phone(options = {})
    @valid_attributes = {
      :id => 1,
      :number => "RSpec is great for testing too"
    }

    @profile_phone.destroy! if @profile_phone
    @profile_phone = ProfilePhone.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_profile_phone
  end

  context "validations" do
    
    it "rejects empty number" do
      ProfilePhone.new(@valid_attributes.merge(:number => "")).should_not be_valid
    end

    it "rejects non unique number" do
      # as one gets created before each spec by reset_profile_phone
      ProfilePhone.new(@valid_attributes).should_not be_valid
    end
    
  end

end