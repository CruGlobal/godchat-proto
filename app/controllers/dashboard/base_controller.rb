class Dashboard::BaseController < ApplicationController
  protect_from_forgery :except => :auth # stop rails CSRF protection for this action
  layout 'dashboard'
  def index
  end

  def auth
    if current_user
      response = Pusher[params[:channel_name]].authenticate(params[:socket_id], {
        :user_id => current_user.id, # => required
        :user_info => { # => optional - for example
          :name => current_user.name,
          :email => current_user.email
        }
      })
      render :json => response
    else
      render :text => "Forbidden", :status => '403'
    end
  end
  
end