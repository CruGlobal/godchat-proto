class VisitorsController < InheritedResources::Base
  #before_filter :get_visitor, only: [:chat, :auth]
  protect_from_forgery

  def index
    @campaign = Campaign.find_by(cname: request.host)
    redirect_to "http://dev.#{ENV['app_url']}:#{request.port}/o/#{@campaign.code}", status: :found
  end
  
  def show
    @campaign = Campaign.find_by(code: params[:code])
    session[:campaign_id] = @campaign.id
  end

  def create
    @visitor = Visitor.where(fb_uid: params[:fb_uid]).first_or_create!(last_campaign_id: session[:campaign_id])
    session[:visitor_id] = @visitor.id
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

end