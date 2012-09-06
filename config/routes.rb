Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :profiles do
    match ':id/:token' => 'profiles#token_edit', :as => :tedit, :via => :get
    match ':id/:token' => 'profiles#update', :as => :tupdate
    match 'email_token' => 'profiles#email_token', :as => :tform, :via => :post  
    match 'token' => 'profiles#token', :as => :token, :via => :get
    resources :profiles, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :profiles, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :profiles, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
