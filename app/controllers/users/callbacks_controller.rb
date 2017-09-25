class Users::CallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], :current_user)
    if @user.persisted?
      sign_in_and_redirect root_path, event: :authentication
    else

      redirect_to new_user_session_path, flash: { error: 'Authentication failed!' }
    end
  end
end
