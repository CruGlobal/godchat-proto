class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :first_name, :last_name, :ip, :location, :status

  has_and_belongs_to_many :languages

  devise :omniauthable, :omniauth_providers => [:facebook, :twitter, :gplus]

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
                          email:auth.info.email,
                          password:Devise.friendly_token[0,20]
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


end
