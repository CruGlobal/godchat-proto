class Conversation < ActiveRecord::Base
  belongs_to :operator
  belongs_to :visitor
  has_many :messages

  before_validation :set_channel

  validates :operator_id, :channel, :visitor_id, :topic, presence: true

  def set_channel
    return channel if channel

    loop do
      self.channel = SecureRandom.hex(10)
      break channel unless Conversation.find_by(channel: channel)
    end
  end
end
