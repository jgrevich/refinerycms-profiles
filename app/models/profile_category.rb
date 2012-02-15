class ProfileCategory < ActiveRecord::Base
  default_scope order('name ASC')
  
  has_many :profile_categorizations
  has_many :profiles, :through => :profile_categorizations
  
  validates :name, :presence => true
  
#  has_friendly_id :name, :use_slug => true
end