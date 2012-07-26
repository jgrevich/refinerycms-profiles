module Refinery
  module Profiles
    class ProfileCategoriesController < ::ApplicationController

      helper [:profiles, :profile_categories]
  
      def show
        @profile_category = ProfileCategory.find(params[:id])
        @profile_categories = ProfileCategory.all
        @other_profiles = Profile.live.limit(5)
        # @profiles = @profile_category.profiles.paginate({
        #       :page => params[:page],
        #       :per_page => RefinerySetting.find_or_set(:profiles_per_page, 10)
        #     })
        #     render :template => 'profiles/index'
      end

    end
  end
end