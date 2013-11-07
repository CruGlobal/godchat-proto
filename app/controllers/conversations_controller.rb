class ConversationsController < ApplicationController
  def show
    @conversation = Conversation.find_by(channel: params[:channel])
    if @conversation
      sign_in(@conversation.insider)
      redirect_to insiders_path and return
    end
  end

  def create
    campaign = Campaign.find(params[:campaign_id])
    visitor = Visitor.find(params[:visitor][:id])
    insider = Insider.where(uid: insider_params[:fb_uid], provider: 'facebook')
                     .first_or_create(first_name: insider_params[:first_name], last_name: insider_params[:last_name])

    conversation = insider.conversations.where(visitor_id: visitor.id)
                                        .first_or_create!(topic: [visitor.name, campaign.name].join(' - '))

    render json: {link: channel_conversation_url(channel: conversation.channel)}
  end

  def insider_params
    params.require(:insider).permit(:first_name, :last_name, :fb_uid)
  end
end