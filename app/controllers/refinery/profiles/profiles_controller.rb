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

        def email_token
          email = Refinery::Profiles::Email.find_by_content(params[:email])

          if email
            profile = email.emailable
            profile.generate_token
            ProfileMailer.email_token(profile).deliver
            flash[:success] = "We have emailed a time-sensitive link that will allow you to update your profile. Please contact us at iem@ucsd.edu if you need assistance."
          else
            flash[:error] = "That email is not in our system. Are you sure you typed it correctly?"
          end

          redirect_to refinery.profiles_token_path
        end

        def token_edit
          @profile = Profile.find_by_token(params[:token])

          if token_valid?
            @profile_categories = Refinery::Profiles::Category.all
            render "token_edit", :layout => 'refinery/admin'
          else
            flash[:error] = "Token is expired or does not exist."
            redirect_to refinery.profiles_token_path
          end
        end

        def update
          @profile = Profile.find_by_token(params[:token])
          params[:profile][:photo] = Image.create(:image => params[:profile][:photo]) if params[:profile][:photo]
          if @profile.update_attributes(params[:profile]) && token_valid?
            # @profile.update_attribute :token, nil
            flash[:success] = "Profile updated successfully." # The link to edit this profile has been expired.
            redirect_to refinery.profiles_token_url
          else
            flash[:error] = "There was an error."
            @profile_categories = Refinery::Profiles::Category.all
            render "token_edit", :layout => 'refinery/admin'
          end
        end

      protected

        def find_all_profiles
          @profiles = Profile.paginate(:page => params[:page]).order('position ASC')
        end

        def find_page
          @page = Page.where(:link_url => "/profiles").first
        end

        def token_valid?
          return nil if @profile.blank?
          hours = (Time.now - @profile.token_created_at)/3600
          limit = 24
          hours < limit
        end

    end
  end
end
