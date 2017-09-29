class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end


  def google_oauth2
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
    if @user.persisted? flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
      redirect_to root_path
    else
      session["devise.google_data"] = request.env["omniauth.auth"] redirect_to new_user_registration_url
    end
  end
end
 
  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  GET|POST /resource/auth/google
  def passthru
    super
    render status: 404, plain: "Not found. Authentication passthru."
  end

  GET|POST /users/auth/google/callback
  def failure
    super
  end

  protected

  The path used when OmniAuth fails
  def after_omniauth_failure_path_for(:google)
    super(:user)
  end
end
