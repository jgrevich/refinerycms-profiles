module Refinery
  module Profiles
    class Department < Refinery::Core::BaseModel

      has_and_belongs_to_many :organizations, :join_table => "departments_organizations", :class_name => "::Refinery::Profiles::Organization"
      has_and_belongs_to_many :titles, :join_table => "departments_titles", :class_name => "::Refinery::Profiles::Title"
      has_many :affiliations, :class_name => "::Refinery::Profiles::Affiliation"
      has_many :emails, :as => :emailable, :class_name => "::Refinery::Profiles::Email"
      has_many :phones, :as => :phonable, :class_name => "::Refinery::Profiles::Phone"
      has_many :urls, :as => :urlable, :class_name => "::Refinery::Profiles::Url"

      validates :name, :presence => true, :uniqueness => true
  
      def to_s
        self.name
      end
      
    end
  end
end
