module Refinery
  module Profiles
    class Affiliation < Refinery::Core::BaseModel

      belongs_to :department, :class_name => "::Refinery::Profiles::Department"
      belongs_to :organization, :class_name => "::Refinery::Profiles::Organization"
      belongs_to :profile, :class_name => "::Refinery::Profiles::Profile"
      belongs_to :title, :class_name => "::Refinery::Profiles::Title"

    #  accepts_nested_attributes_for :department, :organization, :title
    #  validates_associated  :department, :organization, :title

      def to_s
        affiliation = "#{self.title}, #{self.department}, #{self.organization}"
      end
      
    end
  end
end
