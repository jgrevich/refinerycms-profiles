class ProfileCategorization < ActiveRecord::Base

  belongs_to :profile
  belongs_to :profile_category

end