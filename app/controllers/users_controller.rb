class UsersController < ApplicationController
before_action :authenticate_user!

 def index
   @users = User.all
 end

 def create
   @user = User.new(set_user_params)
    if @user.save
      redirect_to root_path
    else
    #  user_password = params[:session][:password]
    #  user_email = params[:session][:email]
    #  user = user_email.present? && User.find_by(email: :user_email)
     #
    #  if user && valid_password? user_password
    #    sign_in user, store: false
    #    user.generate_authentication_token!
    #    user.save
    #    render json: user, status: 200, location: [:api, :user]
    #  else
    #    render json: { errors: "Invalid email or password" }, status: 422
    #  end
   end

 def show
   @users = User.find_by(params[:id])
 end

 private

 def authenticate_user!
  unless current_user
     flash[:alert] = "Unauthorized Access: Genius, go back!"
     redirect_to root_path
   end
 end

end
