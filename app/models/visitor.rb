class Visitor < ActiveRecord::Base
  has_many :conversations
  has_many :insiders, through: :conversations
  belongs_to :last_campaign, :class_name => "Campaign", :foreign_key => "last_campaign_id"
  
  before_create :get_fb_profile, :create_missionhub_contact

  def get_fb_profile
    profile = JSON.parse(RestClient.get("https://graph.facebook.com?id=#{fb_uid}"))
    self.first_name = profile['first_name']
    self.last_name = profile['last_name']
    self.fb_username = profile['username']
    self.locale = profile['locale']
    self.gender = profile['gender']
  end

  def create_missionhub_contact
    params = {
        person: {
              first_name: first_name,
              last_name: last_name,
              gender: gender,
              fb_uid: fb_uid
        }
    }
    mh_person = JSON.parse(RestClient.post("#{ENV['missionhub_url']}/apis/v3/people?secret=#{last_campaign.missionhub_secret}", params))['person']
    self.missionhub_id = mh_person['id']
  end

  def name
    [first_name, last_name].join(' ')
  end

end
