Rails.application.routes.draw do
  namespace :api do
    get 'psgc/fetch_provinces', to: 'psgc#fetch_provinces'
    get 'psgc/fetch_cities_municipalities/:province_code', to: 'psgc#fetch_cities_municipalities'
    get 'psgc/fetch_barangays/:city_or_municipality_code', to: 'psgc#fetch_barangays'
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
    root to: "devise/sessions#new"
  end
  
  patch 'profile/update_profile_picture', to: 'profile#update_profile_picture', as: 'update_profile_picture'
  
  namespace :admin do
    resources :dashboard, only: [:index] do
      post :create_admin_account, on: :collection
    end
    
    resources :residents do
      collection do
        get 'pending', to: 'residents#pending'
      end
    end 
    
    resources :announcements
    resources :complaints, only: [:index, :edit, :update, :show]
    resources :posts
  end


  namespace :resident do
    resources :dashboard, only: [:index]
    resources :posts, only: [:index, :new, :create, :show] do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create, :destroy]
      collection do
        get 'my_posts', to: 'posts#my_posts'
      end
    end
    resources :announcements, only: [:index, :show]
    resources :complaints, only: [:index, :show, :new, :create]
    
  end
end

