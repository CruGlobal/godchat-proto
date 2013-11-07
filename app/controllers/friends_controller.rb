class FriendsController < ApplicationController
  def find
    request_params = { 'filters[is_friends_with]' => params[:id], 'filters[roles]' => 'Admin,Leader,Involved,User', 'secret' => ENV['missionhub_key']}
    render :json => RestClient.get("https://www.missionhub.com/apis/v3/people", {params: request_params})
  end
end
