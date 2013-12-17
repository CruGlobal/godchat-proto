class ConversationsController < ApplicationController
  def create
    campaign = Campaign.find(params[:campaign_id])
    visitor = Visitor.find(params[:visitor][:id])
    operator = Operator.where(uid: operator_params[:fb_uid], provider: 'facebook')
                     .first_or_create(first_name: operator_params[:first_name], last_name: operator_params[:last_name])

    conversation = operator.conversations.where(visitor_id: visitor.id)
                                        .first_or_create!(topic: [visitor.name, campaign.name].join(' - '))

    render json: {link: channel_conversation_url(channel: conversation.channel)}
  end

  def operator_params
    params.require(:operator).permit(:first_name, :last_name, :fb_uid)
  end
end