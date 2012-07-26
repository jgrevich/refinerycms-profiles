module Refinery
  module Profiles
    class Email < Refinery::Core::BaseModel
      
      belongs_to :emailable, :polymorphic => true, :class_name => "::Refinery::Profiles::Email"
      validates :content, :presence => true, :uniqueness => true
  
      def to_s
        self.content
      end
      
    end
  end
end
