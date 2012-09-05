module Refinery
  module Profiles
    class Categorization < Refinery::Core::BaseModel

      belongs_to :profile, :class_name => "::Refinery::Profiles::Profile"
      belongs_to :category, :class_name => "::Refinery::Profiles::Category"
      
    end
  end
end