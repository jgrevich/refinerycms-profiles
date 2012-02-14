class ProfileOrganization < ActiveRecord::Base

  has_and_belongs_to_many :departments, :join_table => "departments_organizations", :class_name => "ProfileDepartment"
  has_many :affiliaitons, :class_name => "ProfileAffiliaitons"
  has_many :emails, :as => :emailable, :class_name => "ProfileEmail"
  has_many :phones, :as => :phonable, :class_name => "ProfilePhone"
  has_many :urls, :as => :urlable, :class_name => "ProfileUrl"

  validates :name, :presence => true, :uniqueness => true
  
  def to_s
    self.name
  end
end