Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      delete 'sessions' => 'sessions#destroy'
      resources :users, only: [:create]
    end
  end

  root "welcome#welcome"

  resources :users, except: [:show]
  get "users/confirming" => 'users#confirming', as: 'send'
  get 'users/email_confirm' => 'users#confirm'
  post "users/email_confirm" => 'users#email_confirm'
  get 'users/reconfirm' => 'users#reconfirm'
  
  resources :search, only: [:create]
  
  get "/session/new" => 'sessions#new'
  post "/session" => 'sessions#create'
  delete '/session' => 'sessions#destroy'
  
  resources :car_profiles do
    
    resources :comments, only: [:create, :destroy] do
      resources :likes, only: [:create, :destroy]
    end
    
    resources :favorites, only: [:index, :create, :destroy]
  end

  resources :welcome, only: [:welcome, :index]

  resources :accounts,  only: [:show]

end
