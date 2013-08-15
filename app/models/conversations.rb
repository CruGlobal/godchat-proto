class Conversations < ActiveRecord::Base
  belongs_to :insider
  belongs_to :outsider
  attr_accessible :topic
  has_many :messages
end
