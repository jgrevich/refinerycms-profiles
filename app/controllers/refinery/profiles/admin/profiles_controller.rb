module Refinery
  module Profiles
    module Admin
      class ProfilesController < ::Refinery::AdminController

        before_filter :find_categories, :except => :index
        helper :'refinery/profiles/profiles'
    
        crudify :'refinery/profiles/profile', :title_attribute => 'first_name', :xhr_paging => true

        def new
          @profile = Refinery::Profiles::Profile.new
          %w{emails locations phones urls}.each { |m| @profile.send(m).build }
        end

        protected
        
        def find_categories
          @profile_categories = Refinery::Profiles::Category.all
        end
        
      end
    end
  end
end
