class VisitorsController < ApplicationController
  before_filter :get_visitor, only: [:chat, :auth]
  def create
    @visitor = Visitor.where(fb_uid: params[:fb_uid]).first_or_create!(last_campaign_id: session[:campaign_id])
    session[:visitor_id] = @visitor.id
  end

  def chat
  end

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

  private

  def get_visitor
    @visitor = Visitor.find(session[:visitor_id])
  end
end
