class Campaign < ActiveRecord::Base
  validates :name, :missionhub_secret, presence: true
end
