class CampaignsController < ApplicationController
  protect_from_forgery
  layout 'campaigns'
  def show
    @campaign = Campaign.find(params[:id])
    session[:campaign_id] = @campaign.id
  end

  def index
    @campaign = Campaign.find_by(domain: request.host)
    @campaign ||= Campaign.find(session[:campaign_id]) if session[:campaign_id]
    @campaign ||= Campaign.first
    session[:campaign_id] = @campaign.id

    render action: :show
  end

end