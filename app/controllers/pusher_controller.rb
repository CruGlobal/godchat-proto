class PusherController < ApplicationController
  protect_from_forgery :except => :presence # stop rails CSRF protection for this action
  def presence
    webhook = Pusher.webhook(request)
    if webhook.valid?
      webhook.events.each do |event|
        case event[:channel]
        when "presence-call-center"
          case event[:name]
          when "member_added"
            User.find(event[:user_id]).set_status(User::STATE[:online])
          when "member_removed"
            User.find(event[:user_id]).set_status(User::STATE[:offline])
          end
        end
      end
      render text: 'ok'
    else
      render text: 'invalid', status: 401
    end
  end
end
