class VisitorsController < ApplicationController

  def index
    if request.host == ENV['visitor_app_url']
      @campaign = Campaign.find_by(code: params[:code])
      @campaign ||= Campaign.first
    else
      @campaign = Campaign.find_by(cname: request.host)
      if @campaign
        redirect_to "http://#{ENV['visitor_app_url']}:#{request.port}/o/#{@campaign.code}"
      else
        redirect_to "http://#{ENV['visitor_app_url']}:#{request.port}"
      end
    end
  end


end