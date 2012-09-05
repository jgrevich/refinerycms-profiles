module Refinery
  module Profiles
    class Organization < Refinery::Core::BaseModel
      attr_accessible :name

      has_and_belongs_to_many :departments, :join_table => "departments_organizations", :class_name => "::Refinery::Profiles::Department"
      has_many :affiliaitons, :class_name => "::Refinery::Profiles::Affiliation"
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
