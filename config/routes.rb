::Refinery::Application.routes.draw do
  match 'profiles/:id/:token' => 'profiles#token_edit', :as => :tedit, :via => :get
  match 'profiles/:id/:token' => 'profiles#update', :as => :tupdate
  match 'profiles/email_token' => 'profiles#email_token', :as => :tform, :via => :post  
  match 'profiles/token' => 'profiles#token', :as => :token, :via => :get

  resources :profiles, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profiles, :except => :show do
      collection do
        post :update_positions
        get 'category/:id' => 'profile_categories#show', :as => 'category'
      end
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profiles, :except => :show
    resources :profile_categories, :except => :show
  end

  resources :profiles do
    collection do
      get 'category/:id' => 'profile_categories#show', :as => 'category'
    end
  end

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profiles, :except => :show
    resources :profile_categories, :except => :show
  end

  # profile_emails routes
  resources :profile_emails, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_emails, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

  # profile_phones routes
  resources :profile_phones, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_phones, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

  # profile_urls routes
  resources :profile_urls, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_urls, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

  # profile_affiliations routes
  resources :profile_affiliations, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_affiliations, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  
  # profile_titles routes
  resources :profile_titles, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_titles, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  
  # profile_departments routes
  resources :profile_departments, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_departments, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

  # profile_organizations routes
  resources :profile_organizations, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_organizations, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

end
