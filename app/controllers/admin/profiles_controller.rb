module Admin
  class ProfilesController < Admin::BaseController
    
    
    crudify :profile, :title_attribute => 'first_name', :xhr_paging => true
    helper :profiles
  end
end
