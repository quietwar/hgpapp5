class AuthenticationsController< Devise::OmniauthCallbacksController

  def create
    auth = request.env[":google_oauth2"]
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"])
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
