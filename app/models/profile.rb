class Profile < ActiveRecord::Base

  acts_as_indexed :fields => [:first_name, :middle_name, :last_name, :bio]
  alias_attribute :title, :name
  default_scope :order => 'last_name ASC'

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  
  
  belongs_to :photo, :class_name => 'Image', :dependent => :destroy
  has_many :affiliations, :class_name => "ProfileAffiliation"
  has_many :emails, :as => :emailable, :class_name => "ProfileEmail"
  has_many :phones, :as => :phonable, :class_name => "ProfilePhone"
  has_many :urls, :as => :urlable, :class_name => "ProfileUrl"
  
  accepts_nested_attributes_for :affiliations, :emails, :phones, :urls
  validates_associated :emails, :phones
  
  def name
    self.first_name + ' ' + self.last_name
  end
  
  def email
    self.emails.first
  end
  
  def phone
    self.phones.first
  end
  
  def url
    self.urls.first
  end 
end
