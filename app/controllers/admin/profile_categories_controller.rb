module Admin
  class ProfileCategoriesController < Admin::BaseController


    crudify :profile_category,
            :title_attribute => :name,
            :xhr_paging => true
            

  end
end