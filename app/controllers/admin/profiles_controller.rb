module Admin
  class ProfilesController < Admin::BaseController
    
    before_filter :find_categories, :except => :index
    
    crudify :profile, :title_attribute => 'first_name', :xhr_paging => true
    
    helper :profiles
    
    protected
    
    def find_categories
      @profile_categories = ProfileCategory.all
    end
    
  end
end
