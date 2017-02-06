class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  # def authenticate_user!
  #   unless signed_in?
  #     redirect_to user_ninthdecimal_omniauth_authorize_path
  #   else
  #     super
  #   end
  # end

  # def new_session_path(scope)
  #   new_user_session_path
  # end

  # def doorkeeper_oauth_client
  #   @client ||= OAuth2::Client.new(OAUTH_KEY, OAUTH_SECRET, site: OAUTH_HOST)
  # end
  #
  # def doorkeeper_access_token
  #   @token ||= OAuth2::AccessToken.new(doorkeeper_oauth_client, current_user.doorkeeper_access_token) if current_user
  # end
end
