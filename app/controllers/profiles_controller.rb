class ProfilesController < ApplicationController

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
    email = ProfileEmail.find_by_content(params[:email])
    
    if email
      profile = email.emailable
      ProfileMailer.email_token(profile).deliver
      flash[:success] = "We have emailed a time-sensitive link that will allow you to update your profile. Please contact us at iem@ucsd.edu if you need assistance."
    else
      flash[:error] = "That email is not in our system. Are you sure you typed it correctly?"
    end
    
    redirect_to token_url
  end
  
  def token_edit
    @profile = Profile.find_by_token(params[:token])
    @profile_categories = ProfileCategory.all
    render "token_edit", :layout => 'admin'
  end
  
  def update
    @profile = Profile.find_by_token(params[:token])
    if @profile.update_attributes(params[:profile])
      flash[:success] = "Profile updated successfully. The link to edit this profile has been expired."
      redirect_to token_url
    else
      flash[:error] = "There was an error."
      @profile_categories = ProfileCategory.all
      render "token_edit", :layout => 'admin'
    end
  end
  
protected

  def find_all_profiles
    @profiles = Profile.paginate(:page => params[:page]).order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/profiles").first
  end

end
