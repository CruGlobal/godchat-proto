require 'constraints/domain_constraint'
Chatapp::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
     delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  get '/o/:code', to: "visitor#index"

  authenticated :user do
    get 'me', to: "operator#index", as: :operator_dashboard
  end

  constraints Constraints::DomainConstraint.new(ENV['app_url']) do
    root to: "site#index"
    get '/tour', to: "site#tour", as: :tour
    get '/features', to: "site#features", as: :features
    post '/pusher/presence' => 'pusher#presence'
    get 'find_friends' => 'friends#find'
    get '/c/:channel', action: 'index', controller: 'operators', as: :channel_conversation
  end

  root to: "visitor#redirect", as: :campaign_root

  namespace :api, defaults: {format: :json} do
    namespace :visitor do
      post 'auth'
      get 'chat'
    end
    namespace :operator do
      post 'auth'
      resources :memberships do
        resources :campaigns, only: [:index, :create, :update, :destroy]
      end
      resources :conversations, only: [:index, :destroy] do
        resources :messages
      end
    end
  end
end
