class FriendsController < ApplicationController
  def find
    # 'filters[roles]' => 'Admin,Leader,Involved,User',
    request_params = { 'filters[is_friends_with]' => params[:id], 'secret' => ENV['missionhub_key']}
    render :json => RestClient.get("#{ENV['missionhub_url']}/apis/v3/people", {params: request_params})
  end
end
