class AuthenticationsController< Devise::OmniauthCallbacksController

  # def create
  #   auth = request.env["google_oauth2"]
  #   user = User.find_for_google_oauth2(request.env["omniauth.auth"])
  #   redirect_to root_url, :notice => "Signed in!"
  # end

  def create
    @user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
     if @user.save!
       redirect_to root_path
     else
       @user = User.new(set_user_params)
     #  user_password = params[:session][:password]
     #  user_email = params[:session][:email]
     #  user = user_email.present? && User.find_by(email: :user_email)

     #  if user && valid_password? user_password
     #    sign_in user, store: false
     #    user.generate_authentication_token!
     #    user.save
     #    render json: user, status: 200, location: [:api, :user]
     #  else
     #    render json: { errors: "Invalid email or password" }, status: 422
     #  end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
