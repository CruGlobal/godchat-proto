class CampaignsController < ApplicationController
  protect_from_forgery
  layout 'campaigns'
  def show
    @campaign = Campaign.find_by(code: params[:code])
    session[:campaign_id] = @campaign.id
  end

  def index
    @campaign = Campaign.find_by(cname: request.host)
    redirect_to "http://dev.#{ENV['app_url']}:#{request.port}/o/#{@campaign.code}", status: :found
  end

end