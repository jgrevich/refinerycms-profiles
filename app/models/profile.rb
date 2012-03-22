class Profile < ActiveRecord::Base

  acts_as_indexed :fields => [:first_name, :middle_name, :last_name, :bio]
  alias_attribute :title, :name
  default_scope :order => 'last_name ASC'

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  
  
  belongs_to :photo, :class_name => 'Image', :dependent => :destroy
  has_friendly_id :name, :use_slug => true,
                    :default_locale => (::Refinery::I18n.default_frontend_locale rescue :en),
                    :approximate_ascii => RefinerySetting.find_or_set(:approximate_ascii, false, :scoping => 'profile'),
                    :strip_non_ascii => RefinerySetting.find_or_set(:strip_non_ascii, false, :scoping => 'profile')
  
  has_many :affiliations, :class_name => "ProfileAffiliation"
  has_many :categories, :through => :profile_categorizations, :source => :profile_category
  has_many :emails, :as => :emailable, :class_name => "ProfileEmail"
  has_many :locations, :as => :locatable, :class_name => "ProfileLocation"
  has_many :phones, :as => :phonable, :class_name => "ProfilePhone"
  has_many :profile_categorizations
  has_many :urls, :as => :urlable, :class_name => "ProfileUrl"
  
  accepts_nested_attributes_for :affiliations, :emails, :locations, :phones, :urls
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
