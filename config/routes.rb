class PersonalizedDomain
  def self.matches?(request)
    ![
      ENV['app_url'],
      "",
      nil
    ].include?(request.host)
  end
end

Chatapp::Application.routes.draw do
  constraints :domain => /\w*.dev.godchat.co/ do 
    get 'connect', to: "index#connect"
  end

  constraints(PersonalizedDomain) do
    scope module: "campaign" do
      root :to => "base#index"
    end
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

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
  
  root to: "site#index", as: :unauthenticated_root
  get '/tour', to: "site#tour", as: :tour
  get '/features', to: "site#features", as: :features

  post '/pusher/presence' => 'pusher#presence'

  get 'find_friends' => 'friends#find'
end
