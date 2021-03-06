module Refinery
  module Profiles
    class ProfileMailer < ActionMailer::Base
      default :from => "iem@ucsd.edu"
  
      def email_token(profile)
        @profile = profile
        @url = [refinery.profiles_profile_url(@profile, :host => "test.iem.ucsd.edu"), profile.token].join('/')
        mail(:to => profile.email, :subject => "iem.ucsd.edu Profile Update")
      end
    end
  end
end
