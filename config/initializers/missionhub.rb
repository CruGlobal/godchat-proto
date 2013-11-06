require 'missionhub'

MissionHub.config do |c|
  c.site = "https://www.missionhub.com/apis/v3"
  c.client_secret = ENV['missionhub_key']
end
