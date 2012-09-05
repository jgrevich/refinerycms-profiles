module Refinery
  module Profiles
    class ProfilesController < ::ApplicationController

      before_filter :find_all_profiles
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @profile in the line below:
        present(@page)
      end

      def show
        @profile = Profile.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @profile in the line below:
        present(@page)
      end

    protected

      def find_all_profiles
        @profiles = Profile.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/profiles").first
      end

    end
  end
end
