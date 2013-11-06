Chatapp::Application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :campaigns
  
  authenticated :user do
    namespace :engineer do
      root to: "dashboard#index"
      resources :campaigns
      resources :organizations
    end

    namespace :agent do
      root to: "dashboard#index"
      post 'auth', to: "dashboard#auth"
    end
  end
  
  root to: "site#index"
  get '/tour', to: "site#tour", as: :tour
  get '/features', to: "site#features", as: :features

  post '/pusher/presence' => 'pusher#presence'

  get 'find_friends' => 'friends#find'
end
