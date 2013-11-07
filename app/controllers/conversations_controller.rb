class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find_by(channel: params[:channel])
    if @conversation
      session[:user_id] = @conversation.insider_id
      redirect_to insiders_path and return
    end
  end

  def create
    campaign = Campaign.find(params[:campaign_id])
    visitor = Visitor.find(params[:visitor][:id])
    insider = Insider.where(uid: params[:insider][:fb_uid], provider: 'facebook')
                     .first_or_create(params[:insider].slice(:first_name, :last_name))

    conversation = insider.conversations.create!(visitor: visitor, topic: [visitor.name, campaign.name].join(' - '))

    render json: {link: "/c/#{conversation.channel}"}
  end
end

#{channel, visitor}