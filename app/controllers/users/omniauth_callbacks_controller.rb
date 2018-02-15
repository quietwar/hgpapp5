class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
     @user = User.from_omniauth(request.env["omniauth.auth"])

     if @user.persisted?
       sign_in_and_redirect @user, event: :authentication
       set_flash_message(:notice, :success, kind: "Google") if is_navigational_format?
     else
       session["devise.google_data"] = request.env["omniauth.auth"]
       redirect_to new_user_registration_url
     end
   end
  



  def self.from_omniauth(access_token)
     data = access_token.info
     user = User.where(email: data['email']).first

     # Uncomment the section below if you want users to be created if they don't exist
     unless user
         user = User.create(name: data['name'],
            email: data['email'],
            password: Devise.friendly_token[0,20]
         )
     end
     user
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
