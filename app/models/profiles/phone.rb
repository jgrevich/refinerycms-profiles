module Refinery
  module Profiles
    class Phone < Refinery::Core::BaseModel

      attr_accessible :label, :number, :primary
      belongs_to :phonable, :polymorphic => true, :class_name => "::Refinery::Profiles:Phone"
      validates :number, :presence => true, :uniqueness => true
  
      def to_s
        self.number
      end

    end
  end  
end
