class Insider::DashboardController < ApplicationController
  protect_from_forgery :except => :auth # stop rails CSRF protection for this action
  layout 'insider'
  def index
    @channel_name = flash[:channel_name]
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
  
  def connect
    sign_in User.find(4)
    flash[:channel_name] = "TEST"
    redirect_to action: 'index'
  end
end