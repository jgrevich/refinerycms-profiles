class ProfileLocation < ActiveRecord::Base

  belongs_to :locatable, :polymorphic => true

end
