module Refinery
  module Profiles
    class Title < Refinery::Core::BaseModel

      attr_accessible :name

      has_and_belongs_to_many :departments, :join_table => "departments_titles", :class_name => "::Refinery::Profiles::Department"
      has_many :affiliaitons, :class_name => "::Refinery::Profiles::Affiliation"
      validates :name, :presence => true, :uniqueness => true
  
      def to_s
        self.name
      end

    end
  end
end
