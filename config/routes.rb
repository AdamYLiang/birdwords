Rails.application.routes.draw do

  #root is '/' 
  root to: 'static_pages#root' 
  # get '/chirps', to: 'chirps#index', as: 'chirps'
  # get '/chirps/:id', to: 'chirps#show'
  # post '/chirps', to: 'chirps#create'
  # patch '/chirps/:id', to: 'chirps#update'
  # delete '/chirps/:id', to: 'chirps#destroy'

  #namespace :api is convention to denote returning JSON 
  namespace :api, defaults: { format: :json } do
    # when it looks for a view, look for json format first
    resources :chirps, only: [:index, :create, :show]
    resources :users, only: [:show, :index, :create]
  end

  # Includes only the specified routes
  resources :chirps, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do 
      get :get_cookie
      get :set_cookie
    end
  end

  resources :users, only: [:new, :create, :destroy]
  
  #singular resource for session, no session table
  resource :session, only: [:new, :create, :destroy]
  
  # Includes all the restful routes.
  # resources :chirps 

  # excludes the specified routes
  # resources :chirps, except: [:new, :edit]
end
