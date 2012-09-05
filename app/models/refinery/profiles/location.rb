module Refinery
  module Profiles
    class Location < Refinery::Core::BaseModel
      
      attr_accessible :building_acronym, :building_name, :mail_code, :room_number

      belongs_to :locatable, :polymorphic => true

    end
  end
end
