Chatapp::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  authenticated :user do
    scope module: "dashboard" do
      root :to => "dashboard#index"
    end
  end

  root to: "site#index"
end
