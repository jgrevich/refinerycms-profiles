module Refinery
  module Profiles
    class Location < Refinery::Core::BaseModel
      
      attr_accessible :building_acronym, :building_name, :mail_code, :room_number, :label

      belongs_to :locatable, :polymorphic => true

    end
  end
end
