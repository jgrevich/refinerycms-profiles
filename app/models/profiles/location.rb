module Refinery
  module Profiles
    class Profile < Refinery::Core::BaseModel

      belongs_to :locatable, :polymorphic => true

    end
  end
end
