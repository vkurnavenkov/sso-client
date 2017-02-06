class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:ninthdecimal]

  def self.find_or_create_for_ninthdecimal_oauth(oauth_data)
    User.find_or_initialize_by(doorkeeper_uid: oauth_data.uid).tap do |user|
      user.email = oauth_data.info.email
      user.first_name = oauth_data.info.first_name
      user.last_name = oauth_data.info.last_name
    end
  end

  def update_doorkeeper_credentials(oauth_data)
    self.doorkeeper_access_token = oauth_data.credentials.token
  end

  # def self.from_omniauth(auth)
  #     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  #       user.provider = auth.provider
  #       user.uid = auth.uid
  #       user.email = auth.info.email
  #       user.password = Devise.friendly_token[0,20]
  #     end
  # end
end
