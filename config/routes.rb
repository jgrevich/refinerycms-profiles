Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :profiles do
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
