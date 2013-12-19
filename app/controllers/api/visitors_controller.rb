class Api::VisitorsController < InheritedResources::Base
  protect_from_forgery

  def auth
    if @visitor.conversations.find_by(channel: params[:channel_name])
      response = Pusher[params[:channel_name]].authenticate(params[:socket_id], {
          :user_id => @visitor.id, # => required
          :user_info => { # => optional - for example
                          :name => @visitor.name,
                          :email => ''
          }
      })
      render :json => response
    else
      render :text => "Forbidden", :status => '403'
    end
  end

  def chat

  end

end