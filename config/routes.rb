Chatapp::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :campaigns
  resources :visitors
  resources :conversations

  authenticated :user do
    namespace :engineer do
      root to: "dashboard#index"
      resources :campaigns
      resources :organizations
    end

    resources :insiders do
      member do
        post 'auth'
      end
    end
  end
  
  root to: "site#index"
  get '/tour', to: "site#tour", as: :tour
  get '/features', to: "site#features", as: :features

  post '/pusher/presence' => 'pusher#presence'

  get 'find_friends' => 'friends#find'

  get '/c/:channel', action: 'show', controller: 'conversations'
end
