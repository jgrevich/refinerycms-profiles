class ProfileAffiliation < ActiveRecord::Base
    
  belongs_to :department, :class_name => "ProfileDepartment"
  belongs_to :organization, :class_name => "ProfileOrganization"
  belongs_to :profile
  belongs_to :title, :class_name => "ProfileTitle"

#  accepts_nested_attributes_for :department, :organization, :title
#  validates_associated  :department, :organization, :title

  def to_s
    affiliation = "#{self.title}, #{self.department}, #{self.organization}"
  end
end
