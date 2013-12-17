class User < ActiveRecord::Base
  ROLES = %w[admin operator friend]

  devise :registerable, :trackable

  has_and_belongs_to_many :languages

  has_many :conversations, foreign_key: :operator_id
  has_many :outsiders, through: :conversations

  devise :omniauthable, :omniauth_providers => [:facebook]

  # constants
  STATE = {
    :offline => 0,
    :online => 1,
    :busy => 2,
    :away => 3
  }


  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(first_name:auth.extra.raw_info.first_name,
                          last_name:auth.extra.raw_info.last_name,
                          provider:auth.provider,
                          uid:auth.uid,
                          email:auth.info.email
                          )
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def name
    first_name + " " + last_name
  end

  def set_status(status)
    self.status = status
    self.save
  end

  # Role Assignment
  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def is?(role)
    roles.include?(role.to_s)
  end



end
