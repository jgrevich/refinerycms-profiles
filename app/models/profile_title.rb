class ProfileTitle < ActiveRecord::Base

  has_and_belongs_to_many :departments, :join_table => "departments_titles", :class_name => "ProfileDepartment"
  has_many :affiliaitons, :class_name => "ProfileAffiliaitons"
  validates :name, :presence => true, :uniqueness => true
  
  def to_s
    self.name
  end
end
