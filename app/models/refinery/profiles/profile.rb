module Refinery
  module Profiles
    class Profile < Refinery::Core::BaseModel
      extend Devise::Models
      acts_as_taggable_on :keywords
      acts_as_indexed :fields => [:first_name, :middle_name, :last_name, :bio, :keyword_list]

      
      self.table_name = 'refinery_profiles'

      extend FriendlyId
      friendly_id :name, :use => :slugged

      belongs_to :photo, :class_name => '::Refinery::Image', :dependent => :destroy
      
      has_many :affiliations, :class_name => "::Refinery::Profiles::Affiliation", :dependent => :destroy
      has_many :categorizations, :dependent => :destroy, :class_name => "::Refinery::Profiles::Categorization", :dependent => :destroy
      has_many :categories, :through => :categorizations, :source => :profile_category
      has_many :emails, :as => :emailable, :class_name => "::Refinery::Profiles::Email", :dependent => :destroy
      has_many :locations, :as => :locatable, :class_name => "::Refinery::Profiles::Location", :dependent => :destroy
      has_many :phones, :as => :phonable, :class_name => "::Refinery::Profiles::Phone", :dependent => :destroy
      has_many :urls, :as => :urlable, :class_name => "::Refinery::Profiles::Url", :dependent => :destroy

      acts_as_indexed :fields => [:first_name, :middle_name, :last_name, :bio]

      default_scope :order => 'last_name ASC'

      alias_attribute :title, :name

      attr_accessible :prefix, :first_name, :middle_name, :last_name, :suffix, :affiliations_attributes, :locations_attributes, :phones_attributes, :emails_attributes, :urls_attributes, :photo_id, :bio, :position, :building_acronym, :room_number, :keyword_list, :label

      accepts_nested_attributes_for :affiliations, :emails, :locations, :phones, :urls, :allow_destroy => true

      validates :first_name, :presence => true
      validates :last_name, :presence => true
      validates_associated :emails, :locations, :phones, :urls



      def affiliation
        self.affiliations.first
      end

      def name
        @name = self.first_name
        @name += " #{self.middle_name}" if !self.middle_name.blank?
        @name += " #{self.last_name}"
      end

      def email
        self.emails.first
      end

      def location
        self.locations.first
      end

      def phone
        self.phones.first
      end

      def url
        self.urls.first
      end

      def next
        self.class.next(self).first
      end

      def prev
        self.class.previous(self).first
      end

      def generate_token
        self.token = Profile.friendly_token
        self.token_created_at = Time.now
        self.save
      end

      class << self

        def next(item)
          self.send(:with_exclusive_scope) do
            where("last_name > ?", item.last_name).order("last_name ASC")
          end
        end

        def previous(item)
          self.send(:with_exclusive_scope) do
            where("last_name < ?", item.last_name).order("last_name DESC")
          end
        end

        def friendly_token
          SecureRandom.base64(25).tr('+/=lIO0', 'pqrsxyz')
        end

      end
    end
  end
end