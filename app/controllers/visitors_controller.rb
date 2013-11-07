class VisitorsController < ApplicationController
  def create
    @visitor = Visitor.where(fb_uid: params[:fb_uid]).first_or_create!(last_campaign_id: session[:campaign_id])
  end
end
