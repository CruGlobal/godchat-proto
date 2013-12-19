class Api::OperatorsController < ApplicationController
  before_filter :authenticate_user!
  protect_from_forgery except: :auth

  def auth
    if user_signed_in?
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