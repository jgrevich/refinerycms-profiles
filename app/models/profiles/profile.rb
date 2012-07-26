module Refinery
  module Profiles
    class Profile < Refinery::Core::BaseModel
      
      acts_as_indexed :fields => [:first_name, :middle_name, :last_name, :bio]

      alias_attribute :title, :name

      default_scope :order => 'last_name ASC'

      extend FriendlyId
      friendly_id :friendly_id_source, :use => [:slugged, :globalize]

      belongs_to :photo, :class_name => '::Refinery::Image', :dependent => :destroy
      
      has_many :affiliations, :class_name => "::Refinery::Profiles::Affiliation"
      has_many :categorizations, :dependent => :destroy, :class_name => "::Refinery::Profiles::Categorization"
      has_many :categories, :through => :categorizations, :source => :profile_category
      has_many :emails, :as => :emailable, :class_name => "::Refinery::Profiles::Email"
      has_many :locations, :as => :locatable, :class_name => "::Refinery::Profiles::Location"
      has_many :phones, :as => :phonable, :class_name => "::Refinery::Profiles::Phone"
      has_many :urls, :as => :urlable, :class_name => "::Refinery::Profiles::Url"

      accepts_nested_attributes_for :affiliations, :emails, :locations, :phones, :urls
      validates :first_name, :presence => true
      validates :last_name, :presence => true
      validates_associated :emails, :phones

      def name
        @name = self.first_name
        @name += " #{self.middle_name}" if !self.middle_name.blank?
        @name += " #{self.last_name}"
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

      def next
        self.class.next(self).first
      end

      def prev
        self.class.previous(self).first
      end

      class << self
        def next(item)
          self.send(:with_exclusive_scope) do
            where("last_name > ?", item.last_name).order("last_name ASC")
          end
        end

        def previous(item)
          where("last_name < ?", item.last_name)
        end

      end
    end
  end
end