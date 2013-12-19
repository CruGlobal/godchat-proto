class VisitorController < ApplicationController

  def index
    @campaign = Campaign.find_by(code: params[:code])
    session[:campaign_id] = @campaign.id
  end

  def redirect
    @campaign = Campaign.find_by(cname: request.host)
    redirect_to "http://dev.#{ENV['app_url']}:#{request.port}/o/#{@campaign.code}", status: :found
  end

end