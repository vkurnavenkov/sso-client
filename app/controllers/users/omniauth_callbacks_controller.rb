class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def ninthdecimal
    binding.pry
    oauth_data = request.env["omniauth.auth"]
    @user = User.find_or_create_for_ninthdecimal_oauth(oauth_data)
    @user.update_doorkeeper_credentials(oauth_data)
    @user.save!

    sign_in_and_redirect @user
  end

  def failure
    redirect_to root_path, notice: 'Failed to login!'
  end
end
