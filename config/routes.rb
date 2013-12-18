
Chatapp::Application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
     delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :campaigns
  resources :visitors do
    collection do
      post 'auth'
      get 'chat'
    end
  end
  resources :conversations

  #authenticated :user do
    resources :operators do
      collection do
        post 'auth'
      end
    end
  #end
  
  root to: "site#index"#, :constraints => { :domain => ENV['app_url'] }
  root to: "campaigns#index", as: :campaign_root

  get '/tour', to: "site#tour", as: :tour
  get '/features', to: "site#features", as: :features

  post '/pusher/presence' => 'pusher#presence'

  get 'find_friends' => 'friends#find'

  get '/c/:channel', action: 'index', controller: 'operators', as: :channel_conversation
end
