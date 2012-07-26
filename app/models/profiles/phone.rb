module Refinery
  module Profiles
    class Phone < Refinery::Core::BaseModel

      belongs_to :phonable, :polymorphic => true, :class_name => "::Refinery::Profiles:Phone"
      validates :number, :presence => true, :uniqueness => true
  
      def to_s
        self.number
      end

    end
  end  
end
