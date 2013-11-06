class CampaignsController < ApplicationController
  protect_from_forgery
  layout 'campaigns'
  def show
    @campaign = Campaign.find(params[:id])
  end
  
end