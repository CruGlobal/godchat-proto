class Insider < User
  has_many :conversations
  has_many :outsiders, through: :conversations

  devise :omniauthable, :omniauth_providers => [:facebook]
end
