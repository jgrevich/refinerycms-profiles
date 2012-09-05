module Refinery
  module Profiles
    class Url < Refinery::Core::BaseModel

      attr_accessible :content, :label, :primary

      belongs_to :urlable, :polymorphic => true, :class_name => "::Refinery::Profiles::Url"
      validates :content, :presence => true, :uniqueness => true

      def to_s
        self.content
      end

    end
  end
end
