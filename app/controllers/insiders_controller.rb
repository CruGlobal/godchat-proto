class InsidersController < ApplicationController
  protect_from_forgery :except => :auth # stop rails CSRF protection for this action
  layout 'insider'
  def index
    if params[:channel]
      load_conversation
    end

    @visitors = []
    if user_signed_in?
      current_user.conversations.each do |conversation|
        @visitors << conversation.visitor.attributes.merge(channel: conversation.channel)
      end
    end
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

  private
  def load_conversation
    @conversation = Conversation.find_by(channel: params[:channel])
    if @conversation
      sign_in(@conversation.insider)
    end
  end
end