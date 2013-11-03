Chatapp::Application.routes.draw do
  api_version(:module => "V1", :path => {:value => "v1"}) do
    namespace :call do
      post 'accept', to: "index#accept"
      get 'connect', to: "index#connect"
    end
    post 'status', to: "user#status"
    resource :message, only: [:create] do
      put 'read', on: :member
    end 
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  authenticated :user do
    scope module: "engine" do
      root to: "base#index", as: :authenticated_root
    end
  end

  unauthenticated do
    root to: "site#index", as: :unauthenticated_root
    get '/tour', to: "site#tour", as: :tour
    get '/features', to: "site#features", as: :features
  end

  post '/pusher/presence' => 'pusher#presence'
end
