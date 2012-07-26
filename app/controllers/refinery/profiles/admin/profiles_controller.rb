module Refinery
  module Profiles
    module Admin
      class ProfilesController < ::Refinery::AdminController

        before_filter :find_categories, :except => :index
    
        crudify :profile, :title_attribute => 'first_name', :xhr_paging => true
    
        helper :profiles
    
        protected
        
        def find_categories
          @profile_categories = Refinery::Profiles::Category.all
        end
        
      end
    end
  end
end
