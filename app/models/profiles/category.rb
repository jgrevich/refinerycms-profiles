module Refinery
  module Profiles
    class Category < Refinery::Core::BaseModel

      default_scope order('name ASC')

      has_many :categorizations, :class_name => "::Refinery::Profiles::Categorization"
      has_many :profiles, :through => :profile_categorizations, :class_name => "::Refinery::Profiles::Profile"

      validates :name, :presence => true

    end
  end
end