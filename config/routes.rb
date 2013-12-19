require 'constraints/domain_constraint'
Chatapp::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
     delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :visitors do
    collection do
      post 'auth'
      get 'chat'
    end
  end

  resources :operators do
    collection do
      post 'auth'
    end
  end
  
  get '/o/:code', to: "visitors#show"

  constraints Constraints::DomainConstraint.new(ENV['app_url']) do
    root to: "site#index"
    get '/tour', to: "site#tour", as: :tour
    get '/features', to: "site#features", as: :features
    post '/pusher/presence' => 'pusher#presence'
    get 'find_friends' => 'friends#find'
    get '/c/:channel', action: 'index', controller: 'operators', as: :channel_conversation
  end

  root to: "visitors#index", as: :campaign_root
end
