require 'spec_helper'

module Refinery
  module Profiles
    describe Profile do
      describe "validations" do
        subject do
          FactoryGirl.create(:profile,
          :prefix => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:prefix) { should == "Refinery CMS" }
      end
    end
  end
end
