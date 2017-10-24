class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    byebug
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], :current_user)
    if @user.persisted? flash[:notice] = I18n.t("devise.omniauth_callbacks.success"), :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication

    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
      return
    end
  end

  # GET|POST /resource/auth/google
  def passthru
    super
    render status: 404, plain: "Not found. Authentication passthru."
  end
  #
  # GET|POST /users/auth/google/callback
  def failure
      redirect_to root_path
      return
    super
  end

  protected

  # #The path used when OmniAuth fails
   def after_omniauth_failure_path_for(scope)
        redirect_to root_path
        return
     super(:user)
    end
  end
