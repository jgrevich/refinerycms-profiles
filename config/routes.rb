::Refinery::Application.routes.draw do
  resources :profiles, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile do
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
  
  resources :profile_emails, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_emails, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

  resources :profile_phones, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_phones, :except => :show do
      collection do
        post :update_positions
      end
    end
  end

  resources :profile_urls, :only => [:index, :show]
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_urls, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :profile_affiliations, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_affiliations, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :profile_titles, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_titles, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :profile_departments, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_departments, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :profile_organizations, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :profile_organizations, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
