class CampaignsController < ApplicationController
  protect_from_forgery
  layout 'campaigns'
  def show
    @campaign = Campaign.find(params[:id])
    session[:campaign_id] = @campaign.id
  end

  def index
    redirect_to Campaign.first_or_create
  end

end