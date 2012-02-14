require 'spec_helper'

describe ProfileAffiliation do

  def reset_profile_affiliation(options = {})
    @valid_attributes = {
      :id => 1
    }

    @profile_affiliation.destroy! if @profile_affiliation
    @profile_affiliation = ProfileAffiliation.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_profile_affiliation
  end

  context "validations" do
    
  end

end