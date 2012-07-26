module Refinery
  module Profiles
    module Admin
      class CategoriesController < ::Refinery::AdminController

    crudify :profile_category,
            :title_attribute => :name,
            :xhr_paging => true

      end
    end
  end
end